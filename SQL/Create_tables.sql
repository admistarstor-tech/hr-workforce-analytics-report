-- ============================================================
-- HR Workforce Analytics Dashboard
-- 01_create_tables.sql
-- Creates the normalized relational schema (4 tables)
-- ============================================================

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    manager VARCHAR(100)
);

CREATE TABLE Employees (
    employeeid VARCHAR(20) PRIMARY KEY,
    employeename VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    department_id INT,
    position VARCHAR(50),
    hiredate DATE,
    tenureyears DOUBLE,
    employmentstatus VARCHAR(50),
    recruitmentsource VARCHAR(100),
    recruitmentdays INT,
    salary DECIMAL(12,2),
    resignedflag INT,
    resigneddate DATE,
    resignreason VARCHAR(255),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employeeid VARCHAR(20),
    attendancedate DATE,
    workinghours DOUBLE,
    lateminutes INT,
    overtimehours DOUBLE,
    absentflag INT,
    FOREIGN KEY (employeeid) REFERENCES Employees(employeeid)
);

CREATE TABLE Performance_review (
    reviewid VARCHAR(20) PRIMARY KEY,
    employeeid VARCHAR(20),
    reviewdate DATE,
    performancescore INT,
    performancerating VARCHAR(50),
    traininghours INT,
    FOREIGN KEY (employeeid) REFERENCES Employees(employeeid)
);
