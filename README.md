# HR Analytics: Employee Attrition Dashboard

An end-to-end HR analytics project that analyzes attrition and workforce patterns across **50,000 employee records**, using SQL for the KPIs and three dashboards (Excel, Power BI and Tableau) for reporting.

## Business Questions
- What is the overall attrition rate, and how does it differ by department?
- Does monthly income, time since last promotion, or work-life balance relate to attrition?
- What does the workforce look like by job role, age group and tenure?

## Tools Used
| Area | Tools |
|---|---|
| Data modeling & KPIs | SQL (MySQL) |
| Dashboards | Excel, Power BI (DAX), Tableau |

## Data
Two source tables, `HR1` (employee profile and satisfaction) and `HR2` (income, tenure and promotion history), joined on `EmployeeNumber = EmployeeID`. The merged dataset has 50,000 rows.

## KPIs Built in SQL
1. Attrition rate by department
2. Average hourly rate of male Research Scientists
3. Attrition rate by monthly income band
4. Average total working years by department
5. Average work-life balance by job role
6. Attrition rate by years since last promotion

All queries are in [`Hr_Analytics.sql`](Hr_Analytics.sql).

## Dashboards
| Tool | File | Highlights |
|---|---|---|
| Excel | [`HR_Workforce_Dashboard.xlsx`](HR_Workforce_Dashboard.xlsx) | Formula-driven dashboard with dropdown filters (department, gender, job role) |
| Power BI | [`HR_Dashboard.pbix`](HR_Dashboard.pbix) | Interactive report with DAX measures |
| Tableau | [`HR_Dashboard_Tableau.twbx`](HR_Dashboard_Tableau.twbx) | Packaged workbook with the same KPIs |

## Key Findings
- **Overall attrition rate is 50.2%** (25,105 of 50,000 employees).
- **Attrition is almost flat across departments**, from 49.4% (Hardware) to 51.2% (Research & Development), so department alone does not explain who leaves.
- **Income band makes little difference.** Every band sits between 49.8% and 50.9%.
- The average hourly rate for male Research Scientists is **114.45**.
- Because no single factor stands out, a useful next step would be to combine factors (for example overtime, promotion gap and job satisfaction) rather than look at them one at a time.

## Repository Structure
```
hr-analytics-dashboard/
├── README.md
├── Hr_Analytics.sql
├── HR_Workforce_Dashboard.xlsx
├── HR_Dashboard.pbix
└── HR_Dashboard_Tableau.twbx
```

## How to Use
1. Run `Hr_Analytics.sql` in MySQL to create the tables and KPI queries (load your data into `HR1` and `HR2` first).
2. Open the Excel workbook and use the dropdown filters on the dashboard sheets.
3. Open the `.pbix` in Power BI Desktop and the `.twbx` in Tableau Desktop or Tableau Public.

## Author
**Vaibhav Kamble**, Junior Data Analyst
[LinkedIn](https://www.linkedin.com/in/vaibhav-kamble-4a4a34416)
