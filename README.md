# HR Workforce Analytics Report
End-to-end HR analytics project: MySQL data modeling + Power BI dashboard analyzing attrition drivers, performance gaps, and training-performance correlation for a 1,500-employee company

**Author:** Tan Le Minh (M)

**Role:** Data Analyst (Solo Project)

**Duration:** Jul 21, 2026 – Aug 21, 2026

**Tools:** MySQL · Excel · Power BI (Data Modeling & DAX)

---

## 📌 Executive Summary

This project analyzes workforce data (2018–2027) for a company that grew from 26 to 1,500+ employees. While day-to-day operations (attendance, absenteeism) are healthy, two structural issues stand out:

1. **Attrition is concentrated among long-tenured employees (5+ years)** — driven primarily by workload and salary concerns, not a hiring/onboarding problem.
2. **Training investment shows no measurable link to performance outcomes**, while one department (Operations) significantly underperforms all others.

Recruitment channels are diversified and performing evenly, with **time-to-hire (50 days)** as the main area worth optimizing.

---

## 🎯 Objectives

- Provide a single, up-to-date view of workforce health across attendance, performance, retention, and recruitment
- Identify which employee segments (tenure, department, resignation reason) drive attrition, enabling targeted retention action
- Surface performance gaps between departments/managers to flag where intervention is needed
- Evaluate whether training investment translates into measurable performance improvement
- Assess recruitment channel effectiveness to guide hiring budget allocation
- Replace anecdotal impressions with evidence-based talking points for budget and policy discussions

**Target audiences:** HR Team · Department Managers · Executive Stakeholders

---

## 🗂️ Data & Model

Raw dataset (26 fields, 1,500+ employee records) cleaned and normalized in **MySQL** into 4 relational tables, then modeled in **Power BI** using a star schema with a DAX-generated Date Table:

| Table | Type | Description |
|---|---|---|
| `Employees` | Dimension | Demographics, employment status, tenure, resignation details |
| `Departments` | Dimension | Department name and manager |
| `Attendance` | Fact | Daily working hours, lateness, overtime, absences |
| `Performance review` | Fact | Periodic review scores, ratings, training hours |
| `Date Table` | Dimension | Standalone calendar table driving time-based trend visuals |

### Data Cleaning Process
- Resolved duplicate, missing, and inconsistent records
- Applied primary/foreign key relationships across all fact/dimension tables
- Deduplicated performance records via `ROW_NUMBER() OVER (PARTITION BY ...)` to keep the latest review per employee
- Built Power BI relationships and DAX measures — designed to **answer specific business questions**, not just display raw numbers

<img width="731" height="1380" alt="Screenshot 2026-08-11 163512" src="https://github.com/user-attachments/assets/5d9e1df3-407f-4788-a060-de3b096d3424" />


---

## 📊 Dashboard Structure (6 Pages)

### 1. Workforce Overview
<img width="1960" height="1106" alt="1 Workforce" src="https://github.com/user-attachments/assets/e1229ddb-a91d-46ed-969b-6b1d78fe4af3" />


- Grew from 26 (2018) to a peak of 1,500 (2025), now 1,387 active employees
- Even gender split (49.68% M / 50.32% F), average age 39.62 — a mature workforce
- Headcount has stabilized, signaling a shift from growth phase to structural optimization

### 2. Attendance Analysis
<img width="1950" height="1096" alt="2 Attendance" src="https://github.com/user-attachments/assets/4c1704c0-82c3-493a-b773-d47b0cf665fa" />


- Strong attendance rate (97.18%), low absenteeism (2.83%)
- Late-arrival patterns are individual-level, not department-driven — better suited to targeted coaching than blanket policy
- IT and HR log the highest total work hours, largely explained by headcount size rather than workload intensity

### 3. Attrition Analysis
<img width="1953" height="1096" alt="3 Attrition" src="https://github.com/user-attachments/assets/745ce3b3-80fd-46ae-a68e-d25ed7325861" />


- **Attrition rate: 7.53%** (113 resignations)
- **Key finding:** ~half of resignations (54) came from employees with 5+ years tenure vs. effectively none under 1 year
- Top resignation reasons: Workload (22.12%) and Salary (20.35%) — together account for 42%+ of departures
- **Insight:** the company is losing experienced, mid-career talent — a higher-cost retention risk than typical early-tenure turnover

### 4. Performance Analysis
<img width="1956" height="1095" alt="4 Performance" src="https://github.com/user-attachments/assets/05810418-ba82-4412-9881-e846c268f08f" />


- Average performance score stable at 71.54 (flat trend over ~2 years)
- KPI achievement rate (28.21%) is *lower* than the low-performance rate (30.28%)
- **Manager Operations is a clear outlier at 67.11**, notably below every other department (71.8–72.3 range)

### 5. Recruitment Analysis
<img width="1953" height="1097" alt="5 Recruitment" src="https://github.com/user-attachments/assets/af5b7396-0d2f-4ea7-8a70-847226b9c15c" />


- Average time-to-hire: **50 days** — the clearest operational bottleneck on the dashboard
- Hiring diversified evenly across 6 sources; Internal referrals produce the highest-performing hires (72.10 avg)
- Average tenure before resignation (5.16 years) reinforces that turnover is a retention issue, not a hiring-quality issue

### 6. Training & Development
<img width="1956" height="1096" alt="6 Training Development" src="https://github.com/user-attachments/assets/f0823cd3-e3fa-4f75-b447-8e2ffef5f605" />



- 268.74 average training hours per employee — yet performance scores are nearly identical across all training-hour brackets (71.36–71.61)
- **Finding:** training hours show no measurable correlation with performance
- Finance and Marketing over-invest in training relative to performance return; Operations (the underperforming department) is not the top training recipient

---

## ✅ Summary of Recommendations

| Priority | Recommendation | Why |
|---|---|---|
| 1 | Investigate Manager Operations' performance gap | Single clearest, most isolated issue on the dashboard; low effort, high impact |
| 2 | Reallocate training budget from volume → relevance | Zero correlation between training hours and performance; "no-downside" reallocation opportunity |
| 3 | Review salary & workload for employees with 5+ years tenure | Attrition is concentrated here; Workload + Salary = 42% of stated resignation reasons |
| 4 | Diagnose the 50-day time-to-hire bottleneck | Clear, measurable inefficiency with well-defined scope |
| 5 | Increase investment in internal referral hiring | Highest-performing hire source; modest but consistent gain |
| 6 | Re-audit the late-arrival tracking definition | Data-quality fix needed for reliable future reporting |

---

## ⚠️ Limitations of Dataset

- **Synthetically generated data** — some patterns (e.g., near-uniform late-minute values, voluntary-only resignation reasons) reflect data-generation artifacts rather than real workplace behavior. Findings should be read as a demonstration of analytical process, not validated real-world conclusions.
- No involuntary termination data — a planned "Voluntary vs. Involuntary Turnover" analysis could not be built
- No recruitment funnel/cost data — only successfully hired employees are captured
- No location, certification, or internal transfer fields
- Late Arrival Rate is not usable as-is due to a "Late Minutes" field that almost never records a true zero
- Salary was flagged as a valuable dimension but not fully explored (planned as a future extension)

---

## 💡 What I Learned

- Most of the effort went into understanding **why** something wasn't working, not writing queries — debugging duplicate primary keys taught more about the data's real structure than upfront planning could have
- Learned to let the data challenge assumptions — some planned metrics (e.g., Early Attrition Rate) didn't hold up once checked, requiring the analysis to adapt rather than force a result
- Writing DAX exposed how a formula can be syntactically correct but evaluate wrong due to filter context
- Started treating "this looks flat or wrong" as a signal to investigate the data further, not just reformat — the Training Hours vs. Performance result is a genuine finding, not a mistake
- Realized how much of "analysis" is judgment calls: choosing thresholds, handling messy records, deciding what *not* to include when data doesn't support it
- This is a work in progress with clear next steps identified (e.g., deeper salary analysis), not a finished, polished product

---

## 📁 Repository Structure

```
├── sql/
│   ├── 01_create_tables.sql
│   └── 02_load_data.sql
├── dashboard/
│   └── HR_Workforce_Analytics.pbix
├── screenshots/
│   ├── 01_workforce.png
│   ├── 02_attendance.png
│   ├── 03_attrition.png
│   ├── 04_performance.png
│   ├── 05_recruitment.png
│   └── 06_training.png
└── README.md
```

## 🔗 Links
- **Live Power BI Dashboard:** [View here](https://app.powerbi.com/view?r=eyJrIjoiNDYxYmZiNTEtODNmZi00Y2I5LThkNWItYjljZGJlNDEwOWIxIiwidCI6ImVkOGYxNjczLTM4OTAtNGRiNC1hM2YwLTk3YWQ5NDI3Yzc0ZiIsImMiOjEwfQ%3D%3D)
- **Repository:** [hr-workforce-analytics-dashboard](https://github.com/admistartor-tech/hr-workforce-analytics-dashboard)
