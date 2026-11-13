CREATE DATABASE hr_analytics;
USE hr_analytics;

CREATE TABLE HR1 (
    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(50),
    DailyRate INT,
    Department VARCHAR(100),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(100),
    EmployeeCount INT,
    EmployeeNumber INT PRIMARY KEY,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(20),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(100),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(50)
);

show create table HR1;

CREATE TABLE HR2 (
    EmployeeID INT PRIMARY KEY,
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 VARCHAR(5),
    OverTime VARCHAR(10),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StandardHours INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);

show create table HR2;



USE hr_analytics;

SELECT COUNT(*) AS Total_Rows
FROM HR1;
SELECT COUNT(*) AS Total_Rows
FROM HR2;
   
SELECT COUNT(*) AS Joined_Rows
FROM HR1 h1
INNER JOIN HR2 h2
ON h1.EmployeeNumber = h2.EmployeeID;   

//KPI 1: Average Attrition Rate for All Departments//

SELECT Department,ROUND( AVG(
CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END ) * 100, 2) AS Attrition_Rate
FROM HR1
GROUP BY Department
ORDER BY Attrition_Rate DESC;

//Overall Attrition Rate//

SELECT
ROUND( AVG( CASE
WHEN Attrition = 'Yes' THEN 1
ELSE 0
END) * 100, 2) AS Overall_Attrition_Rate
FROM HR1;


// KPI 2: Average Hourly Rate of Male Research Scientists//

SELECT ROUND(AVG(HourlyRate), 2) AS Avg_Hourly_Rate
FROM HR1
WHERE Gender = 'Male'
AND JobRole = 'Research Scientist';

//KPI 3: Attrition Rate vs Monthly Income///

SELECT CASE
WHEN h2.MonthlyIncome <= 10000 THEN '0-10K'
WHEN h2.MonthlyIncome <= 20000 THEN '10K-20K'
WHEN h2.MonthlyIncome <= 30000 THEN '20K-30K'
WHEN h2.MonthlyIncome <= 40000 THEN '30K-40K'
ELSE '40K+'
END AS Income_Band,ROUND( AVG(
CASE
WHEN h1.Attrition = 'Yes' THEN 1
ELSE 0
END) * 100,2) AS Attrition_Rate
FROM HR1 h1
INNER JOIN HR2 h2
ON h1.EmployeeNumber = h2.EmployeeID
GROUP BY Income_Band
ORDER BY MIN(h2.MonthlyIncome);


/// KPI 4: Average Working Years for Each Department ///


SELECT h1.Department, ROUND(AVG(h2.TotalWorkingYears), 2) AS Avg_Working_Years
FROM HR1 h1
INNER JOIN HR2 h2
ON h1.EmployeeNumber = h2.EmployeeID
GROUP BY h1.Department
ORDER BY Avg_Working_Years DESC;

// KPI 5: Job Role vs Work Life Balance //

SELECT h1.JobRole,ROUND(AVG(h2.WorkLifeBalance), 2) AS Avg_WorkLife_Balance
FROM HR1 h1
INNER JOIN HR2 h2
ON h1.EmployeeNumber = h2.EmployeeID
GROUP BY h1.JobRole
ORDER BY Avg_WorkLife_Balance DESC;

/// KPI 6: Attrition Rate vs Years Since Last Promotion ///

SELECT h2.YearsSinceLastPromotion, ROUND( AVG(
CASE
WHEN h1.Attrition = 'Yes' THEN 1
ELSE 0
END) * 100,2) AS Attrition_Rate
FROM HR1 h1
INNER JOIN HR2 h2
ON h1.EmployeeNumber = h2.EmployeeID
GROUP BY h2.YearsSinceLastPromotion
ORDER BY h2.YearsSinceLastPromotion;