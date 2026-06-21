-- ============================================================
-- EMS Database Project
-- Section 09 - Triggers
-- Task 1: BEFORE INSERT - Auto-Assign emp_ID (Easy, 1 pt)
-- ============================================================


SET SERVEROUTPUT ON;
-- ============================================================
CREATE OR REPLACE TRIGGER TRG_EMP_ID
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
WHEN (NEW.emp_ID IS NULL)
BEGIN
    :NEW.emp_ID := EMP_SEQ.NEXTVAL;
END;
/
-- ============================================================
DECLARE
    v_salary_id NUMBER;
BEGIN
    INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
    VALUES (salary_seq.NEXTVAL, 44000, 44000, 1100, 2)
    RETURNING salary_ID INTO v_salary_id;

    INSERT INTO EMPLOYEE (fname, lname, gender, age, contact_add, emp_email, emp_pass, job_ID, salary_ID)
    VALUES ('Tariq', 'Said', 'M', 30, '11 Oasis Rd, Muscat', 'tariq.said@ems.com',
            'pass123', 2, v_salary_id);

    COMMIT;
END;
/


SELECT emp_ID, fname, lname, emp_email
FROM EMPLOYEE
WHERE emp_email = 'tariq.said@ems.com';

-- ============================================================
-- EMS Database Project
-- Section 09 - Triggers
-- Task 2: AFTER INSERT - Welcome Log (Easy, 1 pt)
-- ============================================================

CREATE SEQUENCE log_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE EMPLOYEE_LOG (
    log_id        NUMBER PRIMARY KEY,
    emp_id        NUMBER,
    action        VARCHAR2(50),
    log_timestamp DATE
);


-- ============================================================
CREATE OR REPLACE TRIGGER TRG_EMP_WELCOME_LOG
AFTER INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    INSERT INTO EMPLOYEE_LOG (log_id, emp_id, action, log_timestamp)
    VALUES (log_seq.NEXTVAL, :NEW.emp_ID, 'NEW HIRE', SYSDATE);
END;
/
-- ============================================================

DECLARE
    v_salary_id_1 NUMBER;
    v_salary_id_2 NUMBER;
BEGIN
    INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
    VALUES (salary_seq.NEXTVAL, 39000, 39000, 900, 3)
    RETURNING salary_ID INTO v_salary_id_1;

    INSERT INTO SALARY_BONUS (salary_ID, amount, annual, bonus, job_ID)
    VALUES (salary_seq.NEXTVAL, 50000, 50000, 1700, 4)
    RETURNING salary_ID INTO v_salary_id_2;

    INSERT INTO EMPLOYEE (fname, lname, gender, age, contact_add, emp_email, emp_pass, job_ID, salary_ID)
    VALUES ('Reem', 'Hassan', 'F', 24, '6 Coral St, Sohar', 'reem.hassan@ems.com',
            'pass123', 3, v_salary_id_1);

    INSERT INTO EMPLOYEE (fname, lname, gender, age, contact_add, emp_email, emp_pass, job_ID, salary_ID)
    VALUES ('Said', 'Al Farsi', 'M', 35, '2 Marina Rd, Muscat', 'said.alfarsi@ems.com',
            'pass123', 4, v_salary_id_2);

    COMMIT;
END;
/
-- ============================================================

SELECT l.log_id, l.emp_id, e.fname || ' ' || e.lname AS employee_name,
       l.action, l.log_timestamp
FROM EMPLOYEE_LOG l
JOIN EMPLOYEE e ON l.emp_id = e.emp_ID
ORDER BY l.log_id;