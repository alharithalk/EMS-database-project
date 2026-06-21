-- ============================================================
-- EMS Database Project
-- Section 05 - Joins
-- Task 1: INNER JOIN - Employee Full Profile (Easy, 1 pt)
-- ============================================================

SELECT e.emp_ID,
       e.fname || ' ' || e.lname AS full_name,
       d.name AS department_name,
       q.position AS job_title,
       s.amount AS salary_amount,
       MAX(l."date") AS latest_leave_date
FROM EMPLOYEE e
INNER JOIN JOB_DEPARTMENT d ON e.job_ID = d.job_ID
INNER JOIN QUALIFICATION q ON e.emp_ID = q.emp_ID
INNER JOIN SALARY_BONUS s ON e.salary_ID = s.salary_ID
INNER JOIN PAYROLL p ON e.emp_ID = p.emp_ID
LEFT JOIN "LEAVE" l ON e.emp_ID = l.emp_ID
GROUP BY e.emp_ID, e.fname, e.lname, d.name, q.position, s.amount
ORDER BY e.emp_ID;


-- ============================================================
-- EMS Database Project
-- Section 05 - Joins
-- Task 2: LEFT OUTER JOIN - Missing Records (Easy, 1 pt)
-- ============================================================
SELECT e.emp_ID,
       e.fname || ' ' || e.lname AS full_name
FROM EMPLOYEE e
LEFT JOIN "LEAVE" l ON e.emp_ID = l.emp_ID
WHERE l.leave_ID IS NULL;


-- ============================================================
-- (b) List all departments that have no salary/bonus records
--     associated with them.
-- ============================================================
SELECT d.job_ID,
       d.name AS department_name
FROM JOB_DEPARTMENT d
LEFT JOIN SALARY_BONUS s ON d.job_ID = s.job_ID
WHERE s.salary_ID IS NULL;