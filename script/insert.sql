-- ============================================================
-- EMS Database Project
-- Section 03 - SQL DML
-- Task 1: Populate All Tables with Seed Data (Easy, 1 pt)



-- ============================================================
-- STEP 1: CREATE SEQUENCES
-- ============================================================

CREATE SEQUENCE job_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE salary_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE emp_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE qual_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE leave_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE payroll_seq START WITH 1 INCREMENT BY 1;


-- ============================================================
-- STEP 2: INSERT DATA (parent tables first)
-- ============================================================

-- ---------------------------------
-- JOB_DEPARTMENT (5 departments)
-- ---------------------------------
INSERT INTO JOB_DEPARTMENT (job_ID, job_dept, name, description, salary_range)
VALUES (job_seq.NEXTVAL, 'IT', 'Information Technology', 'Handles all software and systems', '40000-80000');

INSERT INTO JOB_DEPARTMENT (job_ID, job_dept, name, description, salary_range)
VALUES (job_seq.NEXTVAL, 'HR', 'Human Resources', 'Manages staff and hiring', '35000-60000');

INSERT INTO JOB_DEPARTMENT (job_ID, job_dept, name, description, salary_range)
VALUES (job_seq.NEXTVAL, 'FIN', 'Finance', 'Handles budgets and accounting', '38000-70000');

INSERT INTO JOB_DEPARTMENT (job_ID, job_dept, name, description, salary_range)
VALUES (job_seq.NEXTVAL, 'SALES', 'Sales', 'Manages client accounts and revenue', '30000-65000');

INSERT INTO JOB_DEPARTMENT (job_ID, job_dept, name, description, salary_range)
VALUES (job_seq.NEXTVAL, 'OPS', 'Operations', 'Oversees daily business operations', '32000-58000');


-- ---------------------------------
-- SALARY_BONUS (10 records)
-- job_ID 1-5 = IT, HR, FIN, SALES, OPS (each used twice,
-- once for each of the 10 employees' unique salary record)
-- ---------------------------------
INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
VALUES (salary_seq.NEXTVAL, 60000, 60000, 3000, 1);

INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
VALUES (salary_seq.NEXTVAL, 45000, 45000, 1500, 2);

INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
VALUES (salary_seq.NEXTVAL, 52000, 52000, 2000, 3);

INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
VALUES (salary_seq.NEXTVAL, 40000, 40000, 1000, 4);

INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
VALUES (salary_seq.NEXTVAL, 42000, 42000, 1200, 5);

INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
VALUES (salary_seq.NEXTVAL, 61000, 61000, 3200, 1);

INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
VALUES (salary_seq.NEXTVAL, 46000, 46000, 1600, 2);

INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
VALUES (salary_seq.NEXTVAL, 53000, 53000, 2100, 3);

INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
VALUES (salary_seq.NEXTVAL, 41000, 41000, 1100, 4);

INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
VALUES (salary_seq.NEXTVAL, 43000, 43000, 1300, 5);


-- ---------------------------------
-- EMPLOYEE (10 employees)
-- Each employee has a UNIQUE salary_ID (1:1 relationship)
-- job_ID 1-5 is reused twice each (1:N relationship - OK)
-- ---------------------------------
INSERT INTO EMPLOYEE (emp_ID, fname, lname, gender, age, contact_add, emp_email, emp_pass, job_ID, salary_ID)
VALUES (emp_seq.NEXTVAL, 'John', 'Smith', 'M', 29, '12 Main St, Muscat', 'john.smith@ems.com', 'pass123', 1, 1);

INSERT INTO EMPLOYEE (emp_ID, fname, lname, gender, age, contact_add, emp_email, emp_pass, job_ID, salary_ID)
VALUES (emp_seq.NEXTVAL, 'Sara', 'Ahmed', 'F', 34, '5 Park Rd, Muscat', 'sara.ahmed@ems.com', 'pass123', 2, 2);

INSERT INTO EMPLOYEE (emp_ID, fname, lname, gender, age, contact_add, emp_email, emp_pass, job_ID, salary_ID)
VALUES (emp_seq.NEXTVAL, 'Omar', 'Khalid', 'M', 41, '8 Hill Ave, Sohar', 'omar.khalid@ems.com', 'pass123', 3, 3);

INSERT INTO EMPLOYEE (emp_ID, fname, lname, gender, age, contact_add, emp_email, emp_pass, job_ID, salary_ID)
VALUES (emp_seq.NEXTVAL, 'Maya', 'Said', 'F', 26, '21 Beach Rd, Muscat', 'maya.said@ems.com', 'pass123', 4, 4);

INSERT INTO EMPLOYEE (emp_ID, fname, lname, gender, age, contact_add, emp_email, emp_pass, job_ID, salary_ID)
VALUES (emp_seq.NEXTVAL, 'Yusuf', 'Hamed', 'M', 38, '3 Garden St, Salalah', 'yusuf.hamed@ems.com', 'pass123', 5, 5);

INSERT INTO EMPLOYEE (emp_ID, fname, lname, gender, age, contact_add, emp_email, emp_pass, job_ID, salary_ID)
VALUES (emp_seq.NEXTVAL, 'Layla', 'Nasser', 'F', 31, '14 Lake Rd, Muscat', 'layla.nasser@ems.com', 'pass123', 1, 6);

INSERT INTO EMPLOYEE (emp_ID, fname, lname, gender, age, contact_add, emp_email, emp_pass, job_ID, salary_ID)
VALUES (emp_seq.NEXTVAL, 'Khalid', 'Salim', 'M', 45, '19 Palm St, Muscat', 'khalid.salim@ems.com', 'pass123', 2, 7);

INSERT INTO EMPLOYEE (emp_ID, fname, lname, gender, age, contact_add, emp_email, emp_pass, job_ID, salary_ID)
VALUES (emp_seq.NEXTVAL, 'Fatma', 'Rashid', 'F', 27, '7 River Rd, Nizwa', 'fatma.rashid@ems.com', 'pass123', 3, 8);

INSERT INTO EMPLOYEE (emp_ID, fname, lname, gender, age, contact_add, emp_email, emp_pass, job_ID, salary_ID)
VALUES (emp_seq.NEXTVAL, 'Ali', 'Mahmoud', 'M', 33, '2 Sun St, Muscat', 'ali.mahmoud@ems.com', 'pass123', 4, 9);

INSERT INTO EMPLOYEE (emp_ID, fname, lname, gender, age, contact_add, emp_email, emp_pass, job_ID, salary_ID)
VALUES (emp_seq.NEXTVAL, 'Huda', 'Abdullah', 'F', 36, '16 Star Ave, Sohar', 'huda.abdullah@ems.com', 'pass123', 5, 10);


-- ---------------------------------
-- QUALIFICATION (5 records)
-- emp_ID 1-5 used once each
-- ---------------------------------
INSERT INTO QUALIFICATION (qual_ID, position, requirements, date_in, emp_ID)
VALUES (qual_seq.NEXTVAL, 'Software Developer', 'Bachelor in Computer Science', DATE '2020-01-15', 1);

INSERT INTO QUALIFICATION (qual_ID, position, requirements, date_in, emp_ID)
VALUES (qual_seq.NEXTVAL, 'HR Officer', 'Bachelor in Human Resources', DATE '2019-03-10', 2);

INSERT INTO QUALIFICATION (qual_ID, position, requirements, date_in, emp_ID)
VALUES (qual_seq.NEXTVAL, 'Accountant', 'Bachelor in Finance', DATE '2017-06-01', 3);

INSERT INTO QUALIFICATION (qual_ID, position, requirements, date_in, emp_ID)
VALUES (qual_seq.NEXTVAL, 'Sales Executive', 'Diploma in Business', DATE '2021-09-20', 4);

INSERT INTO QUALIFICATION (qual_ID, position, requirements, date_in, emp_ID)
VALUES (qual_seq.NEXTVAL, 'Operations Manager', 'Bachelor in Business Administration', DATE '2016-11-05', 5);


-- ---------------------------------
-- LEAVE (5 records)
-- emp_ID 1-5 used once each
-- ---------------------------------
INSERT INTO "LEAVE" (leave_ID, "date", reason, emp_ID)
VALUES (leave_seq.NEXTVAL, DATE '2024-02-10', 'Sick leave - flu', 1);

INSERT INTO "LEAVE" (leave_ID, "date", reason, emp_ID)
VALUES (leave_seq.NEXTVAL, DATE '2024-03-05', 'Annual vacation', 2);

INSERT INTO "LEAVE" (leave_ID, "date", reason, emp_ID)
VALUES (leave_seq.NEXTVAL, DATE '2024-04-18', 'Family emergency', 3);

INSERT INTO "LEAVE" (leave_ID, "date", reason, emp_ID)
VALUES (leave_seq.NEXTVAL, DATE '2024-05-22', 'Sick leave - fever', 4);

INSERT INTO "LEAVE" (leave_ID, "date", reason, emp_ID)
VALUES (leave_seq.NEXTVAL, DATE '2024-06-01', 'Personal leave', 5);


-- ---------------------------------
-- PAYROLL (8 records)
-- leave_ID is optional (nullable) - some rows leave it NULL
-- ---------------------------------
INSERT INTO PAYROLL (payroll_ID, "date", report, total_amount, emp_ID, job_ID, salary_ID, leave_ID)
VALUES (payroll_seq.NEXTVAL, DATE '2024-01-31', 'January payroll', 6300, 1, 1, 1, NULL);

INSERT INTO PAYROLL (payroll_ID, "date", report, total_amount, emp_ID, job_ID, salary_ID, leave_ID)
VALUES (payroll_seq.NEXTVAL, DATE '2024-01-31', 'January payroll', 4650, 2, 2, 2, NULL);

INSERT INTO PAYROLL (payroll_ID, "date", report, total_amount, emp_ID, job_ID, salary_ID, leave_ID)
VALUES (payroll_seq.NEXTVAL, DATE '2024-02-29', 'February payroll', 5400, 3, 3, 3, NULL);

INSERT INTO PAYROLL (payroll_ID, "date", report, total_amount, emp_ID, job_ID, salary_ID, leave_ID)
VALUES (payroll_seq.NEXTVAL, DATE '2024-02-29', 'February payroll', 4100, 4, 4, 4, NULL);

INSERT INTO PAYROLL (payroll_ID, "date", report, total_amount, emp_ID, job_ID, salary_ID, leave_ID)
VALUES (payroll_seq.NEXTVAL, DATE '2024-02-10', 'February payroll - leave deduction', 6000, 1, 1, 1, 1);

INSERT INTO PAYROLL (payroll_ID, "date", report, total_amount, emp_ID, job_ID, salary_ID, leave_ID)
VALUES (payroll_seq.NEXTVAL, DATE '2024-03-05', 'March payroll - leave deduction', 4500, 2, 2, 2, 2);

INSERT INTO PAYROLL (payroll_ID, "date", report, total_amount, emp_ID, job_ID, salary_ID, leave_ID)
VALUES (payroll_seq.NEXTVAL, DATE '2024-03-31', 'March payroll', 4300, 5, 5, 5, NULL);

INSERT INTO PAYROLL (payroll_ID, "date", report, total_amount, emp_ID, job_ID, salary_ID, leave_ID)
VALUES (payroll_seq.NEXTVAL, DATE '2024-04-18', 'April payroll - leave deduction', 5200, 3, 3, 3, 3);


-- ============================================================
-- STEP 3: COMMIT
-- ============================================================
COMMIT;


-- ============================================================
-- QUICK CHECK: confirm row counts match the requirement
-- Expected: 5, 10, 10, 5, 5, 8
-- ============================================================
SELECT 'JOB_DEPARTMENT' AS table_name, COUNT(*) AS row_count FROM JOB_DEPARTMENT
UNION ALL
SELECT 'SALARY_BONUS', COUNT(*) FROM SALARY_BONUS
UNION ALL
SELECT 'EMPLOYEE', COUNT(*) FROM EMPLOYEE
UNION ALL
SELECT 'QUALIFICATION', COUNT(*) FROM QUALIFICATION
UNION ALL
SELECT 'LEAVE', COUNT(*) FROM "LEAVE"
UNION ALL
SELECT 'PAYROLL', COUNT(*) FROM PAYROLL;