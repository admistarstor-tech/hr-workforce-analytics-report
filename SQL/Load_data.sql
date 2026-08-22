-- ============================================================
-- HR Workforce Analytics Dashboard
-- 02_load_data.sql
-- Cleans and loads data from the raw staging table ("project")
-- into the normalized schema
-- ============================================================

-- Reset target table before reload
TRUNCATE TABLE Employees;

-- Load Employees: dedupe by keeping the most recent review per employee,
-- join to Departments to resolve department_id, and convert blank
-- date/text values to true NULLs
INSERT INTO Employees (
    employeeid, employeename, gender, age, department_id, position,
    hiredate, tenureyears, employmentstatus, recruitmentsource,
    recruitmentdays, salary, resignedflag, resigneddate, resignreason
)
SELECT
    ranked.employeeid, ranked.employeename, ranked.gender, ranked.age,
    ranked.department_id, ranked.Position,
    NULLIF(ranked.hiredate, ''), ranked.tenureyears, ranked.employmentstatus,
    ranked.recruitmentsource, ranked.recruitmentdays, ranked.salary,
    ranked.resignedflag, NULLIF(ranked.resigneddate, ''), NULLIF(ranked.resignreason, '')
FROM (
    SELECT p.*, d.department_id,
           ROW_NUMBER() OVER (PARTITION BY p.employeeid ORDER BY p.reviewdate DESC) AS rn
    FROM project p
    JOIN Departments d ON p.department = d.department_name
) ranked
WHERE ranked.rn = 1;

-- Load Attendance: deduplicate raw records
INSERT INTO Attendance (
    employeeid, attendancedate, workinghours, lateminutes, overtimehours, absentflag
)
SELECT DISTINCT
    employeeid, attendancedate, workinghours, lateminutes, overtimehours, absentflag
FROM project;

-- Load Performance_review: deduplicate raw records
INSERT INTO Performance_review (
    reviewid, employeeid, reviewdate, performancescore, performancerating, traininghours
)
SELECT DISTINCT
    reviewid, employeeid, reviewdate, performancescore, performancerating, traininghours
FROM project;
