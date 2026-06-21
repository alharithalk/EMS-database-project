-- ============================================================
-- EMS Database Project
-- Section 03 - SQL DML
-- Task 2: Conditional SELECT Queries (Easy, 1 pt)
-- ============================================================
=
SELECT emp_ID, fname, lname, age
FROM EMPLOYEE
WHERE age BETWEEN 25 AND 40
ORDER BY lname ASC;


-- ============================================================
-- (b) Retrieve all payroll records where total_amount exceeds
--     5000, showing employee name and department.
-- ============================================================
SELECT p.payroll_ID,
       e.fname || ' ' || e.lname AS employee_name,
       d.name AS department_name,
       p.total_amount,
       p."date" AS payroll_date
FROM PAYROLL p
JOIN EMPLOYEE e ON p.emp_ID = e.emp_ID
JOIN JOB_DEPARTMENT d ON p.job_ID = d.job_ID
WHERE p.total_amount > 5000;


-- ============================================================
-- (c) Find all employees who have taken leave with reason
--     containing the word 'sick' (case-insensitive).
-- ============================================================
SELECT e.emp_ID,
       e.fname || ' ' || e.lname AS employee_name,
       l.reason,
       l."date" AS leave_date
FROM EMPLOYEE e
JOIN "LEAVE" l ON e.emp_ID = l.emp_ID
WHERE LOWER(l.reason) LIKE '%sick%';


-- ============================================================
-- (d) List all departments that have no employees assigned.
--     (Using NOT EXISTS)
-- ============================================================
SELECT d.job_ID, d.name AS department_name
FROM JOB_DEPARTMENT d
WHERE NOT EXISTS (
    SELECT 1
    FROM EMPLOYEE e
    WHERE e.job_ID = d.job_ID
);