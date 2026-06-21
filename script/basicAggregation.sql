-- ============================================================
-- EMS Database Project
-- Section 04 - Aggregation Functions
-- Task 1: Basic Aggregation (Easy, 1 pt)
-- ============================================================


-- ============================================================
-- (a) Total number of employees in each department.
-- ============================================================
SELECT d.name AS department_name,
       COUNT(e.emp_ID) AS total_employees
FROM JOB_DEPARTMENT d
JOIN EMPLOYEE e ON e.job_ID = d.job_ID
GROUP BY d.name;


-- ============================================================
-- (b) Minimum, maximum, and average salary (amount) across
--     all salary records.
-- ============================================================
SELECT MIN(amount) AS min_salary,
       MAX(amount) AS max_salary,
       ROUND(AVG(amount), 2) AS avg_salary
FROM SALARY_BONUS;


-- ============================================================
-- (c) Total bonus paid out across the entire company.
-- ============================================================
SELECT SUM(bonus) AS total_bonus_paid
FROM SALARY_BONUS;