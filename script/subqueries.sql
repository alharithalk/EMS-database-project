-- ============================================================
-- EMS Database Project
-- Section 06 - Subqueries
-- Task 1: Single-Row Subquery (Easy, 1 pt)
-- ============================================================


-- ============================================================
-- (a) Find all employees whose salary is greater than the
--     average salary of the entire company.
-- ============================================================
SELECT e.emp_ID,
       e.fname || ' ' || e.lname AS full_name,
       s.amount AS salary_amount
FROM EMPLOYEE e
JOIN SALARY_BONUS s ON e.salary_ID = s.salary_ID
WHERE s.amount > (
    SELECT AVG(amount) FROM SALARY_BONUS
);


-- ============================================================
-- (b) Retrieve the department with the highest total payroll
--     amount.
-- ============================================================
SELECT d.job_ID,
       d.name AS department_name
FROM JOB_DEPARTMENT d
WHERE d.job_ID = (
    SELECT p.job_ID
    FROM PAYROLL p
    GROUP BY p.job_ID
    ORDER BY SUM(p.total_amount) DESC
    FETCH FIRST 1 ROW ONLY
);

-- ============================================================
-- EMS Database Project
-- Section 06 - Subqueries
-- Task 2: Multi-Row Subquery with IN / ANY / ALL (Easy, 1 pt)
-- ============================================================
-- (a) List all employees who work in departments that have at
--     least one salary record with a bonus greater than 500.
--     (Use IN)
-- ============================================================
SELECT e.emp_ID,
       e.fname || ' ' || e.lname AS full_name,
       e.job_ID
FROM EMPLOYEE e
WHERE e.job_ID IN (
    SELECT s.job_ID
    FROM SALARY_BONUS s
    WHERE s.bonus > 500
);


-- ============================================================
-- (b) Find employees whose salary is greater than ALL salaries
--     in the 'Maintenance' department. (Use ALL)
-- ============================================================
SELECT e.emp_ID,
       e.fname || ' ' || e.lname AS full_name,
       s.amount AS salary_amount
FROM EMPLOYEE e
JOIN SALARY_BONUS s ON e.salary_ID = s.salary_ID
WHERE s.amount > ALL (
    SELECT s2.amount
    FROM SALARY_BONUS s2
    JOIN JOB_DEPARTMENT d ON s2.job_ID = d.job_ID
    WHERE d.name = 'Sales'
);


-- ============================================================
-- (c) Find employees whose salary is greater than ANY salary
--     in the 'HR' department. (Use ANY)
-- ============================================================
SELECT e.emp_ID,
       e.fname || ' ' || e.lname AS full_name,
       s.amount AS salary_amount
FROM EMPLOYEE e
JOIN SALARY_BONUS s ON e.salary_ID = s.salary_ID
WHERE s.amount > ANY (
    SELECT s2.amount
    FROM SALARY_BONUS s2
    JOIN JOB_DEPARTMENT d ON s2.job_ID = d.job_ID
    WHERE d.name = 'Human Resources'
);
