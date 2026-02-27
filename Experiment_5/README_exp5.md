# Experiment 5 – Cursors in DBMS

## Student Details

- **Student Name:** Sumanyu Seth  
- **UID:** 25MCI10040  
- **Branch:** MCA (AI & ML)  
- **Section/Group:** 25MAM_KAR-1_A  
- **Semester:** II  
- **Subject Name:** Technical Training  
- **Subject Code:** 25CAP-652  
- **Date of Performance:** 24/02/26  

---

# 📌 Experiment Aim

To gain hands-on experience in creating and using cursors for row-by-row processing in a database, enabling sequential access and manipulation of query results for complex business logic.

---

# 🛠 Tools Used

- Oracle (PL/SQL)
- MS SQL Server (SSMS)
- PostgreSQL

---

# 🎯 Objectives

- **Sequential Data Access:** Fetch rows one by one from a result set using cursor mechanisms.
- **Row-Level Manipulation:** Perform conditional operations on individual records.
- **Resource Management:** Understand cursor lifecycle – Declare, Open, Fetch, Close, Deallocate.
- **Exception Handling:** Handle errors and performance considerations during large-scale iteration.

---

# 🗂 Database Setup

```sql
CREATE TABLE Employee (
    emp_id NUMBER,
    emp_name VARCHAR2(50),
    salary NUMBER
);

INSERT INTO Employee VALUES (1,'Rahul',20000);
INSERT INTO Employee VALUES (2,'Amit',0);
INSERT INTO Employee VALUES (3,'Neha',25000);
INSERT INTO Employee VALUES (4,'Anay',20000);
```

---

# 🧪 Step 1: Implementing a Simple Forward-Only Cursor

## 🎯 Aim
Loop through the Employee table and print individual records.

```sql
DECLARE
    CURSOR emp_cursor IS 
        SELECT emp_id, emp_name, salary FROM Employee;

    v_emp_id   Employee.emp_id%TYPE;
    v_emp_name Employee.emp_name%TYPE;
    v_salary   Employee.salary%TYPE;

BEGIN
    OPEN emp_cursor;

    FETCH emp_cursor INTO v_emp_id, v_emp_name, v_salary;

    WHILE emp_cursor%FOUND LOOP

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_emp_id ||
            ' Name: ' || v_emp_name ||
            ' Salary: ' || v_salary
        );

        FETCH emp_cursor INTO v_emp_id, v_emp_name, v_salary;

    END LOOP;

    CLOSE emp_cursor;
END;
```

<img width="487" height="170" alt="image" src="https://github.com/user-attachments/assets/3e24097d-19eb-4c81-8905-7f1961e1b514" />


---

# 🧪 Step 2: Complex Row-by-Row Manipulation

## 🎯 Aim
Update salaries based on conditional performance logic.

## 📊 Salary Update Logic

- Salary < 20000 → Increase by 20%
- Salary between 20000–30000 → Increase by 10%
- Salary > 30000 → Increase by 5%

```sql
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

```

<img width="458" height="137" alt="image" src="https://github.com/user-attachments/assets/3e59f92e-ab94-4164-b4bd-0f13c994adde" />


---

# 🧪 Step 3: Exception and Status Handling

## 🎯 Aim
Handle:
- Zero salary case
- Empty result set
- Unexpected errors
- Proper cursor closing

```sql
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
```

<img width="887" height="122" alt="image" src="https://github.com/user-attachments/assets/018c36f8-5b9a-481c-8a0b-33a60331cf12" />


---

# ✅ Outcomes

- Successfully implemented explicit cursors.
- Understood cursor lifecycle management.
- Applied conditional row-level processing.
- Handled exceptions in PL/SQL.
- Learned importance of closing cursors to prevent memory leaks.

---
