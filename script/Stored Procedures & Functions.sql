-- ============================================================
-- EMS Database Project
-- Section 08 - Stored Procedures & Functions
-- Task 1: Procedure - Add New Employee (Easy, 1 pt)
-- ============================================================

SET SERVEROUTPUT ON;


-- ============================================================
-- Create the procedure: SP_ADD_EMPLOYEE
-- ============================================================
CREATE OR REPLACE PROCEDURE SP_ADD_EMPLOYEE (
    p_fname        IN EMPLOYEE.fname%TYPE,
    p_lname        IN EMPLOYEE.lname%TYPE,
    p_gender       IN EMPLOYEE.gender%TYPE,
    p_age          IN EMPLOYEE.age%TYPE,
    p_contact_add  IN EMPLOYEE.contact_add%TYPE,
    p_emp_email    IN EMPLOYEE.emp_email%TYPE,
    p_emp_pass     IN EMPLOYEE.emp_pass%TYPE,
    p_job_ID       IN EMPLOYEE.job_ID%TYPE,
    p_salary_ID    IN EMPLOYEE.salary_ID%TYPE
) IS
    v_count NUMBER;
    duplicate_email EXCEPTION;
BEGIN
    -- Validate that emp_email is not already in use
    SELECT COUNT(*) INTO v_count
    FROM EMPLOYEE
    WHERE emp_email = p_emp_email;

    IF v_count > 0 THEN
        RAISE duplicate_email;
    END IF;

    -- Insert the new employee record
    INSERT INTO EMPLOYEE (
        emp_ID, fname, lname, gender, age, contact_add,
        emp_email, emp_pass, job_ID, salary_ID
    )
    VALUES (
        emp_seq.NEXTVAL, p_fname, p_lname, p_gender, p_age,
        p_contact_add, p_emp_email, p_emp_pass, p_job_ID, p_salary_ID
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('SUCCESS: Employee ' || p_fname || ' ' || p_lname ||
                          ' added with email ' || p_emp_email || '.');

EXCEPTION
    WHEN duplicate_email THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: An employee with email ' || p_emp_email ||
                              ' already exists. Employee not added.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
        RAISE;
END SP_ADD_EMPLOYEE;
/


-- ============================================================
-- SETUP: Insert one new SALARY_BONUS record for the test

-- ============================================================
INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
VALUES (salary_seq.NEXTVAL, 47000, 47000, 1400, 1);

COMMIT;



DECLARE
    v_new_salary_id NUMBER;
BEGIN
    -- Get the salary_ID just inserted above (the most recent one)
    SELECT MAX(salary_ID) INTO v_new_salary_id FROM SALARY_BONUS;

    SP_ADD_EMPLOYEE(
        p_fname       => 'Nora',
        p_lname       => 'Saleh',
        p_gender      => 'F',
        p_age         => 28,
        p_contact_add => '9 New St, Muscat',
        p_emp_email   => 'nora.saleh@ems.com',
        p_emp_pass    => 'pass123',
        p_job_ID      => 1,
        p_salary_ID   => v_new_salary_id
    );
END;
/


-- ============================================================
-- TEST 2: Call the procedure AGAIN with the SAME email

DECLARE
    v_new_salary_id NUMBER;
BEGIN
    SELECT MAX(salary_ID) INTO v_new_salary_id FROM SALARY_BONUS;

    SP_ADD_EMPLOYEE(
        p_fname       => 'Nora',
        p_lname       => 'Saleh',
        p_gender      => 'F',
        p_age         => 28,
        p_contact_add => '9 New St, Muscat',
        p_emp_email   => 'nora.saleh@ems.com',
        p_emp_pass    => 'pass123',
        p_job_ID      => 1,
        p_salary_ID   => v_new_salary_id
    );
END;
/


-- ============================================================
-- VERIFY: confirm only ONE 'Nora Saleh' row exists
-- ============================================================
SELECT emp_ID, fname, lname, emp_email
FROM EMPLOYEE
WHERE emp_email = 'nora.saleh@ems.com';


-- ============================================================
-- EMS Database Project
-- Section 08 - Stored Procedures & Functions
-- Task 2: Function - Calculate Net Salary (Easy, 1 pt)
-- ============================================================

CREATE OR REPLACE FUNCTION FN_NET_SALARY (
    p_emp_ID IN EMPLOYEE.emp_ID%TYPE
) RETURN NUMBER
IS
    v_net_salary NUMBER;
BEGIN
    SELECT s.amount + s.bonus
    INTO v_net_salary
    FROM EMPLOYEE e
    JOIN SALARY_BONUS s ON e.salary_ID = s.salary_ID
    WHERE e.emp_ID = p_emp_ID;

    RETURN v_net_salary;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END FN_NET_SALARY;
/



SELECT emp_ID,
       fname || ' ' || lname AS full_name,
       FN_NET_SALARY(emp_ID) AS net_salary
FROM EMPLOYEE
ORDER BY net_salary DESC;