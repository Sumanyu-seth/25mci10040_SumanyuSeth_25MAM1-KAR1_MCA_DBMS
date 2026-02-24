CREATE TABLE EMPLOYEE (
    EMP_ID   NUMBER,
    EMP_NAME VARCHAR2(50),
    SALARY   NUMBER
);

INSERT INTO EMPLOYEE VALUES ( 1,
                              'Rahul',
                              20000 );

INSERT INTO EMPLOYEE VALUES ( 2,
                              'Amit',
                              0 );

INSERT INTO EMPLOYEE VALUES ( 3,
                              'Neha',
                              25000 );

BEGIN
    INSERT INTO EMPLOYEE VALUES ( 4,
                                  'Anay',
                                  20000 );

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ROW INSERT SUCCESSFULLY');
    END IF;
    DELETE FROM EMPLOYEE
    WHERE
        EMP_ID = 99;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('ROW DELETE SUCCESSFULLY');
    ELSE
        DBMS_OUTPUT.PUT_LINE('emp_id NOT FOUND');
    END IF;

END;

DECLARE
    CURSOR EMP_CURSOR IS
    SELECT
        EMP_ID,
        EMP_NAME,
        SALARY
    FROM
        EMPLOYEE;

    V_EMP_ID   EMPLOYEE.EMP_ID%TYPE;
    V_EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
    V_SALARY   EMPLOYEE.SALARY%TYPE;
BEGIN
    OPEN EMP_CURSOR;
    FETCH EMP_CURSOR INTO
        V_EMP_ID,
        V_EMP_NAME,
        V_SALARY;
    WHILE EMP_CURSOR%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE('ID: '
                             || V_EMP_ID
                             || ' Name: '
                             || V_EMP_NAME
                             || ' Salary: ' || V_SALARY);

        FETCH EMP_CURSOR INTO
            V_EMP_ID,
            V_EMP_NAME,
            V_SALARY;
    END LOOP;

    CLOSE EMP_CURSOR;
END;


DECLARE
    CURSOR emp_cursor IS 
        SELECT emp_id, salary FROM Employee FOR UPDATE;
    v_emp_id Employee.emp_id%TYPE;
    v_salary Employee.salary%TYPE;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_emp_id, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;
        IF v_salary < 20000 THEN
            UPDATE Employee
            SET salary = v_salary * 1.20
            WHERE CURRENT OF emp_cursor;
        ELSIF v_salary BETWEEN 20000 AND 30000 THEN
            UPDATE Employee
            SET salary = v_salary * 1.10
            WHERE CURRENT OF emp_cursor;
        ELSE
            UPDATE Employee
            SET salary = v_salary * 1.05
            WHERE CURRENT OF emp_cursor;
        END IF;
    END LOOP;
    CLOSE emp_cursor;
    DBMS_OUTPUT.PUT_LINE('Salary Updated Successfully.');
END;


DECLARE
    CURSOR emp_cursor IS 
        SELECT emp_id, salary FROM Employee;
    v_emp_id Employee.emp_id%TYPE;
    v_salary Employee.salary%TYPE;
    salary_zero EXCEPTION;
    no_data EXCEPTION;
BEGIN
    OPEN emp_cursor;
    FETCH emp_cursor INTO v_emp_id, v_salary;
    IF emp_cursor%NOTFOUND THEN
        RAISE no_data;
    END IF;
    WHILE emp_cursor%FOUND LOOP
        IF v_salary = 0 THEN
            RAISE salary_zero;
        END IF;
        DBMS_OUTPUT.PUT_LINE(
            'Processing Employee ID: ' || v_emp_id
        );
        FETCH emp_cursor INTO v_emp_id, v_salary;
    END LOOP;
    CLOSE emp_cursor;
EXCEPTION
    WHEN salary_zero THEN
        DBMS_OUTPUT.PUT_LINE('Error: Salary is zero. Cannot process increment.');
        CLOSE emp_cursor;
    WHEN no_data THEN
        DBMS_OUTPUT.PUT_LINE('No records found in Employee table.');
        CLOSE emp_cursor;
END;