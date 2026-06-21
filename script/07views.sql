-- ============================================================
-- EMS Database Project
-- Section 07 - Views
-- Task 1: Simple Read-Only View (Easy, 1 pt)
-- ============================================================
CREATE OR REPLACE VIEW VW_EMPLOYEE_SUMMARY AS
SELECT e.emp_ID,
       e.fname || ' ' || e.lname AS full_name,
       e.gender,
       e.age,
       d.name AS department_name,
       q.position AS job_title
FROM EMPLOYEE e
JOIN JOB_DEPARTMENT d ON e.job_ID = d.job_ID
LEFT JOIN QUALIFICATION q ON e.emp_ID = q.emp_ID;


-- ============================================================
-- (a) Query the view to list all female employees over 30.
-- ============================================================
SELECT *
FROM VW_EMPLOYEE_SUMMARY
WHERE gender = 'F'
  AND age > 30;


-- ============================================================
-- (b) Try to INSERT a row through this view and document the
--     Oracle error message you receive.
-- ============================================================


INSERT INTO VW_EMPLOYEE_SUMMARY (emp_ID, full_name, gender, age, department_name, job_title)
VALUES (999, 'Test Person', 'M', 40, 'IT', 'Tester');

-- ============================================================
-- EMS Database Project
-- Section 07 - Views
-- Task 2: Payroll Dashboard View (Easy, 1 pt)
-- ===========================================================
-- ============================================================
CREATE OR REPLACE VIEW VW_PAYROLL_DASHBOARD AS
SELECT p.payroll_ID,
       e.fname || ' ' || e.lname AS employee_name,
       d.name AS department_name,
       s.amount AS salary_amount,
       s.bonus,
       l.reason AS leave_reason,
       p."date" AS payroll_date,
       p.total_amount
FROM PAYROLL p
JOIN EMPLOYEE e ON p.emp_ID = e.emp_ID
JOIN JOB_DEPARTMENT d ON p.job_ID = d.job_ID
JOIN SALARY_BONUS s ON p.salary_ID = s.salary_ID
LEFT JOIN "LEAVE" l ON p.leave_ID = l.leave_ID;


-- ============================================================
-- Query the view to find the top 5 payroll records by
-- total_amount.
-- ============================================================
SELECT *
FROM VW_PAYROLL_DASHBOARD
ORDER BY total_amount DESC
FETCH FIRST 5 ROWS ONLY;