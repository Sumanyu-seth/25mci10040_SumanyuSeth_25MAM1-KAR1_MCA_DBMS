# Experiment 1: Database Design Using DDL, DML, and DCL

## Student Information

- **Student Name:** Sumanyu Seth  
- **UID:** 25MCI10040  
- **Branch:** MCA (AI & ML)  
- **Section/Group:** 25MAM_KAR-1_A  
- **Semester:** II  
- **Subject Name:** Technical Training  
- **Subject Code:** 25CAP-652  
- **Date of Performance:** 12/01/26  

---

## Aim

To design and implement a sample database system using **DDL**, **DML**, and **DCL** commands, including database creation, data manipulation, schema modification, and role-based access control to ensure data integrity and secure, read-only access for authorized users. :contentReference[oaicite:0]{index=0}

---

## Software Requirements

- Oracle Database Express Edition  
- pgAdmin  

---

## Objective

To gain practical experience in implementing Data Definition Language (DDL), Data Manipulation Language (DML), and Data Control Language (DCL) operations in a real database environment. This experiment also focuses on implementing role-based privileges to secure database access.

---

## Problem Statement

An organization wants to design a sample database system to manage:

- Departments  
- Employees  
- Projects  

The database must ensure **data integrity**, **controlled access**, and **proper privilege management** for different users.

---

## Requirements

### Database Design
- Create tables: `Department`, `Employee`, `Project`
- Define PRIMARY KEY and FOREIGN KEY constraints
- Enforce NOT NULL, UNIQUE, and CHECK constraints

### Data Manipulation
- Insert sample records
- Update existing records
- Delete records while maintaining referential integrity

### Access Control & Security
- Create a role/user for reporting staff
- Grant **ONLY SELECT** privileges
- Revoke CREATE privileges
- Ensure read-only access

### Schema Modification
- Add/modify columns using `ALTER TABLE`
- Drop unused tables using `DROP TABLE`

---

## Implementation / SQL Code

### Table Creation

```sql
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary INT CHECK (salary > 0),
    dept_id INT,
    CONSTRAINT fk_dept FOREIGN KEY (dept_id)
    REFERENCES Department(dept_id)
    ON DELETE SET NULL
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL,
    dept_id INT NOT NULL,
    CONSTRAINT fk_project_dept FOREIGN KEY (dept_id)
    REFERENCES Department(dept_id)
);

INSERT INTO Department VALUES (1, 'HR', 'Delhi');
INSERT INTO Department VALUES (2, 'IT', 'Bangalore');
INSERT INTO Department VALUES (3, 'Finance', 'Mumbai');

INSERT INTO Employee VALUES (101, 'Amit', 50000, 2);
INSERT INTO Employee VALUES (102, 'Riya', 45000, 1);
INSERT INTO Employee VALUES (103, 'Karan', 60000, 2);

INSERT INTO Project VALUES (201, 'Payroll System', 1);
INSERT INTO Project VALUES (202, 'Website Upgrade', 2);

UPDATE Employee SET salary = 55000 WHERE emp_id = 101;

DELETE FROM Department WHERE dept_id = 3;

CREATE ROLE reporting_staff LOGIN PASSWORD 'reportS1' ;

GRANT SELECT ON Department TO reporting_staff;
GRANT SELECT ON Employee TO reporting_staff;
GRANT SELECT ON Project TO reporting_staff;

REVOKE CREATE ON SCHEMA public FROM reporting_staff;

ALTER TABLE Employee ADD email VARCHAR(50);

DROP TABLE Project;
```
## OUTPUTS:
**Department table**
<img width="340" height="70" alt="image" src="https://github.com/user-attachments/assets/9639bbef-46fe-4922-8e48-3a0c6fdec583" />







**Employee table**
<img width="400" height="85" alt="image" src="https://github.com/user-attachments/assets/5a01560f-7fda-4e83-a127-c28a89207f7d" />


## Reporting_staff query tool OUTPUT:
**create table project_check(employeeid int, projectid int);**
<img width="400" height="50" alt="image" src="https://github.com/user-attachments/assets/daf85109-881d-4b03-aec1-c8faf61d410c" />








**Select * from employee;**
<img width="400" height="90" alt="image" src="https://github.com/user-attachments/assets/b4ca6ee5-f0d9-4345-843a-4ca4fd33aa54" />



## Learning Outcomes

- Designed a relational database using proper table structure and relationships.
- Applied DDL commands to create, alter, and drop database objects.
- Used DML commands to insert, update, and delete records while maintaining data integrity.
- Implemented PRIMARY KEY and FOREIGN KEY constraints to enforce referential integrity.
- Understood and applied CHECK, NOT NULL, and UNIQUE constraints effectively.
- Implemented role-based access control using DCL commands.
- Granted and revoked privileges to ensure secure, read-only access for authorized users.
- Gained hands-on experience with database security and schema modification.
