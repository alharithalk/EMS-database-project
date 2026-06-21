-- ============================================================
-- EMS Database Project
-- Section 10 - Oracle Scheduler Jobs
-- Task 1: Simple One-Time Scheduler Job (Easy, 1 pt)
-- ============================================================
SET SERVEROUTPUT ON;


-- ============================================================
BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
        job_name        => 'JOB_GREET_EMPLOYEES',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN
                                 DBMS_OUTPUT.PUT_LINE(''Payroll System Initialized'');
                                 INSERT INTO EMPLOYEE_LOG (log_id, emp_id, action, log_timestamp)
                                 VALUES (log_seq.NEXTVAL, NULL, ''Payroll System Initialized'', SYSDATE);
                                 COMMIT;
                             END;',
        start_date      => SYSTIMESTAMP + INTERVAL '2' MINUTE,
        enabled         => TRUE
    );
END;
/


-- ============================================================

SELECT log_id, job_name, status, log_date
FROM USER_SCHEDULER_JOB_LOG
WHERE job_name = 'JOB_GREET_EMPLOYEES'
ORDER BY log_date DESC;


-- ============================================================

SELECT log_id, emp_id, action, log_timestamp
FROM EMPLOYEE_LOG
WHERE action = 'Payroll System Initialized';

-- ============================================================
-- EMS Database Project
-- Section 10 - Oracle Scheduler Jobs
-- Task 2: Recurring Job - Daily Leave Report (Easy, 1 pt)
BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
        job_name        => 'JOB_DAILY_LEAVE_REPORT',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'DECLARE
                                 v_leave_count NUMBER;
                             BEGIN
                                 SELECT COUNT(*) INTO v_leave_count
                                 FROM "LEAVE"
                                 WHERE TRUNC("date") = TRUNC(SYSDATE);

                                 INSERT INTO EMPLOYEE_LOG (log_id, emp_id, action, log_timestamp)
                                 VALUES (log_seq.NEXTVAL, NULL,
                                         ''Daily Leave Report: '' || v_leave_count || '' leave record(s) today'',
                                         SYSDATE);
                                 COMMIT;
                             END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY; BYHOUR=7; BYMINUTE=0; BYSECOND=0',
        enabled         => TRUE
    );
END;
/


-- ============================================================
-- Show the job definition, exactly as the task specifies.
-- ============================================================
SELECT * FROM USER_SCHEDULER_JOBS WHERE JOB_NAME = 'JOB_DAILY_LEAVE_REPORT';