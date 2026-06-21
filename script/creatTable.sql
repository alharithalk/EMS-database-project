
CREATE TABLE JOB_DEPARTMENT (
    job_ID         NUMBER          PRIMARY KEY,
    job_dept       VARCHAR2(50)    NOT NULL,
    name           VARCHAR2(100)   NOT NULL,
    description    VARCHAR2(255),
    salary_range   VARCHAR2(50)
);



CREATE TABLE SALARY_BONUS (
    salary_ID      NUMBER          PRIMARY KEY,
    amount         NUMBER(10,2)    NOT NULL CHECK (amount > 0),
    annual         NUMBER(10,2),
    bonus          NUMBER(10,2),
    job_ID         NUMBER          NOT NULL,
    CONSTRAINT fk_salary_job FOREIGN KEY (job_ID)
        REFERENCES JOB_DEPARTMENT(job_ID)
);



CREATE TABLE EMPLOYEE (
    emp_ID         NUMBER          PRIMARY KEY,
    fname          VARCHAR2(50)    NOT NULL,
    lname          VARCHAR2(50)    NOT NULL,
    gender         CHAR(1)         CHECK (gender IN ('M', 'F')),
    age            NUMBER(3),
    contact_add    VARCHAR2(255),
    emp_email      VARCHAR2(100)   UNIQUE,
    emp_pass       VARCHAR2(50)    NOT NULL,
    job_ID         NUMBER          NOT NULL,
    salary_ID      NUMBER          NOT NULL UNIQUE,
    CONSTRAINT fk_emp_job FOREIGN KEY (job_ID)
        REFERENCES JOB_DEPARTMENT(job_ID),
    CONSTRAINT fk_emp_salary FOREIGN KEY (salary_ID)
        REFERENCES SALARY_BONUS(salary_ID)
);



CREATE TABLE QUALIFICATION (
    qual_ID        NUMBER          PRIMARY KEY,
    position       VARCHAR2(100),
    requirements   VARCHAR2(255),
    date_in        DATE,
    emp_ID         NUMBER          NOT NULL,
    CONSTRAINT fk_qual_emp FOREIGN KEY (emp_ID)
        REFERENCES EMPLOYEE(emp_ID)
);



CREATE TABLE "LEAVE" (
    leave_ID       NUMBER          PRIMARY KEY,
    "date"         DATE,
    reason         VARCHAR2(255),
    emp_ID         NUMBER          NOT NULL,
    CONSTRAINT fk_leave_emp FOREIGN KEY (emp_ID)
        REFERENCES EMPLOYEE(emp_ID)
);



CREATE TABLE PAYROLL (
    payroll_ID     NUMBER          PRIMARY KEY,
    "date"         DATE,
    report         VARCHAR2(255),
    total_amount   NUMBER(10,2),
    emp_ID         NUMBER          NOT NULL,
    job_ID         NUMBER          NOT NULL,
    salary_ID      NUMBER          NOT NULL,
    leave_ID       NUMBER          NULL,
    CONSTRAINT fk_payroll_emp FOREIGN KEY (emp_ID)
        REFERENCES EMPLOYEE(emp_ID),
    CONSTRAINT fk_payroll_job FOREIGN KEY (job_ID)
        REFERENCES JOB_DEPARTMENT(job_ID),
    CONSTRAINT fk_payroll_salary FOREIGN KEY (salary_ID)
        REFERENCES SALARY_BONUS(salary_ID),
    CONSTRAINT fk_payroll_leave FOREIGN KEY (leave_ID)
        REFERENCES "LEAVE"(leave_ID)
);