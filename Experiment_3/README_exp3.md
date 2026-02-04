# Experiment 3: Conditional Logic Using CASE and IF–ELSE in PostgreSQL

## Student Information

- **Student Name:** Sumanyu Seth  
- **UID:** 25MCI10040  
- **Branch:** MCA (AI & ML)  
- **Section/Group:** 25MAM_KAR-1_A  
- **Semester:** II  
- **Subject Name:** Technical Training  
- **Subject Code:** 25CAP-652  
- **Date of Performance:** 27/01/26  

---

## Aim / Overview of the Practical

To implement conditional decision-making logic in PostgreSQL using IF–ELSE constructs and CASE expressions for classification, validation, and rule-based data processing. :contentReference[oaicite:0]{index=0}

---

## Software Requirements

- PostgreSQL  

---

## Objectives

- To understand conditional execution in SQL  
- To implement decision-making logic using CASE expressions  
- To simulate real-world rule validation scenarios  
- To classify data based on multiple conditions  
- To strengthen SQL logic skills required in interviews and backend systems  

---

## Theory

In real-world database systems, data often needs to be validated, categorized, or transformed based on business rules. Conditional logic allows the database to make decisions dynamically instead of relying solely on application-layer logic.

PostgreSQL supports conditional logic mainly through:

- CASE expressions (used inside SELECT, UPDATE, INSERT)
- IF–ELSE constructs (used inside PL/pgSQL blocks such as functions and procedures)

### CASE Expression

- Evaluates conditions sequentially  
- Returns a value based on the first true condition  
- Can be used in SELECT, UPDATE, ORDER BY, and WHERE clauses  

### Types of CASE

- Simple CASE → compares expressions  
- Searched CASE → evaluates boolean conditions  

Conditional logic is widely used in:
- Data classification (grades, salary slabs)
- Violation detection
- Status mapping
- Business rule enforcement  

Companies like Amazon, SAP, Oracle, and Adobe frequently test CASE-based SQL logic in interviews.

---

## Practical / Experiment Steps

### Table Creation and Data Insertion

```sql
create table my_schemas (

    id serial primary key,

    schema_name varchar(50),

    violation_count int

);

insert into my_schemas (schema_name, violation_count) values

('alpha', 0),

('beta', 2),

('gamma', 5),

('delta', 10),

 ('epsilon', 1);

SELECT * from my_schemas;
```
### Step 1 : Classifying data using case expression
```sql
select 
    schema_name,
    violation_count,
    case 
        when violation_count = 0 then 'no violation'
        when violation_count between 1 and 3 then 'minor violation'
        else 'critical violation'
    end as violation_status
from my_schemas;

```
<img width="588" height="251" alt="image" src="https://github.com/user-attachments/assets/5915a0a6-73c8-4d3f-bb29-9b1f9c702d46" />

### Step 2: Applying CASE Logic in Data Updates
```sql
update my_schemas
set approval_status = case
    when violation_count = 0 then 'approved'
    when violation_count between 1 and 3 then 'needs review'
    else 'rejected'
end;
select * from my_schemas;
```
<img width="779" height="253" alt="image" src="https://github.com/user-attachments/assets/210c5d88-9faa-49e9-ae5d-649f32c4b6fd" />

### Step 3: Implementing IF–ELSE Logic Using PL/pgSQL
```sql
do $$
declare
    v_count int := 3;
begin
    if v_count = 0 then
        raise notice 'no violation';
    elsif v_count between 1 and 3 then
        raise notice 'minor violation';
    else
        raise notice 'critical violation';
    end if;
end;
$$;

do $$
declare
    v_count int := 0;
begin
    if v_count = 0 then
        raise notice 'no violation';
    elsif v_count between 1 and 3 then
        raise notice 'minor violation';
    else
        raise notice 'critical violation';
    end if;
end;
$$;

do $$
declare
    v_count int := 6;
begin
    if v_count = 0 then
        raise notice 'no violation';
    elsif v_count between 1 and 3 then
        raise notice 'minor violation';
    else
        raise notice 'critical violation';
    end if;
end;
$$;
```
<img width="363" height="63" alt="image" src="https://github.com/user-attachments/assets/052ee934-f07f-4562-937e-65b3513f6100" />
<img width="285" height="73" alt="image" src="https://github.com/user-attachments/assets/1eb19077-6b7c-4128-91cf-d61f879556c0" />
<img width="371" height="60" alt="image" src="https://github.com/user-attachments/assets/3e0d853f-78f3-4c24-b09a-cd3007cb6dec" />
### Step 4: Grading system
```sql
create table student_marks (
    id serial primary key,
    student_name varchar(50),
    marks int
);

insert into student_marks (student_name, marks) values
('amit', 85),
('bobby', 60),
('chaman', 40),
('daksh', 95);
select 
    student_name,
    marks,
    case
        when marks >= 80 then 'grade a'
        when marks >= 60 then 'grade b'
        when marks >= 40 then 'grade c'
        else 'fail'
    end as grade
from student_marks;
```
<img width="440" height="216" alt="image" src="https://github.com/user-attachments/assets/095c3518-d535-44e8-959b-97e84d50a4c9" />

### Step 5: Custom sorting
```aql
select 
    schema_name,
    violation_count
from my_schemas
order by case
    when violation_count = 0 then 1
    when violation_count between 1 and 3 then 2
    else 3
end;
```
<img width="403" height="253" alt="image" src="https://github.com/user-attachments/assets/98315e04-0ac7-4eca-83b2-8e49b149619b" />

## Learning Outcomes

Understand how to classify records using simple CASE expressions.

Learn to automate approval logic directly inside UPDATE statements.

Practice writing IF–ELSE blocks in PL/pgSQL for backend validation.

Apply conditional rules to grade students based on marks.

Explore custom sorting with CASE for reporting and dashboard scenarios.
