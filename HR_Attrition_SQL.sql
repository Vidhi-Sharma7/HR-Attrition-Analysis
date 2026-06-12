CREATE DATABASE hr_analytics;
USE hr_analytics;
SHOW TABLES;
RENAME TABLE `wa_fn-usec_-hr-employee-attrition`
TO hr_attrition;

-- Total number of employees
SELECT COUNT(*) AS total_employees
FROM hr_attrition;

-- Number of employees who left the company
SELECT COUNT(*) AS employees_left
FROM hr_attrition
WHERE Attrition = 'Yes';

-- Calculate overall attrition rate
SELECT
ROUND(
COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0
/ COUNT(*),
2
) AS attrition_rate FROM hr_attrition;

SHOW COLUMNS FROM hr_attrition;

-- Attrition count by department
SELECT
Department,
ROUND(AVG(MonthlyIncome),2) AS avg_salary
FROM hr_attrition
GROUP BY Department
ORDER BY avg_salary DESC;

-- Analyze the impact of overtime on employee attrition
SELECT
OverTime,
COUNT(*) AS employees_left
FROM hr_attrition
WHERE Attrition = 'Yes'
GROUP BY OverTime;

-- Average years at the company by attrition status
SELECT
Attrition,
ROUND(AVG(YearsAtCompany),2) AS avg_years
FROM hr_attrition
GROUP BY Attrition;

 -- Average monthly income by attrition status
SELECT
Attrition,
ROUND(AVG(MonthlyIncome),2) AS avg_income
FROM hr_attrition
GROUP BY Attrition;

-- Attrition Count by Jobrole
SELECT
JobRole,
COUNT(*) AS attrition_count
FROM hr_attrition
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY attrition_count DESC;

-- Attrition Count by WorkLife Balance
SELECT
WorkLifeBalance,
COUNT(*) AS attrition_count
FROM hr_attrition
WHERE Attrition = 'Yes'
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;