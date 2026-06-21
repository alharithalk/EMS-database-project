-- ============================================================
-- EMS Database Project
-- Section 04 - Aggregation Functions
-- Task 2: GROUP BY with HAVING 
-- ============================================================
-- ============================================================
-- (a) List departments where the average employee age
--     exceeds 30.
-- ============================================================
SELECT d.name AS department_name,
       ROUND(AVG(e.age), 2) AS avg_age
FROM JOB_DEPARTMENT d
JOIN EMPLOYEE e ON e.job_ID = d.job_ID
GROUP BY d.name
HAVING AVG(e.age) > 30;


-- ============================================================
-- (b) Show all job titles (QUALIFICATION.position) where more
--     than 2 employees share that qualification position.
-- ============================================================
SELECT q.position,
       COUNT(q.emp_ID) AS employee_count
FROM QUALIFICATION q
GROUP BY q.position
HAVING COUNT(q.emp_ID) > 2;


-- ============================================================
-- (c) Find months (from PAYROLL."date") where the total
--     payroll amount exceeds 20,000.
-- ============================================================
SELECT TO_CHAR(p."date", 'YYYY-MM') AS payroll_month,
       SUM(p.total_amount) AS total_payroll
FROM PAYROLL p
GROUP BY TO_CHAR(p."date", 'YYYY-MM')
HAVING SUM(p.total_amount) > 20000;