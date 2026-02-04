# Experiment 4: Looping Constructs in PostgreSQL (FOR, WHILE, LOOP)

## Student Information

- **Student Name:** Sumanyu Seth  
- **UID:** 25MCI10040  
- **Branch:** MCA (AI & ML)  
- **Section/Group:** 25MAM_KAR-1_A  
- **Semester:** II  
- **Subject Name:** Technical Training  
- **Subject Code:** 25CAP-652  
- **Date of Performance:** 03/02/26  

---

## Aim

To understand and implement looping constructs in PostgreSQL using `FOR`, `WHILE`, and `LOOP` statements for iterative processing, conditional execution, and row-by-row data handling using existing database tables.

---

## Software Requirements

- PostgreSQL  
- pgAdmin  

---

## Objectives

- To understand different looping constructs in PostgreSQL  
- To implement fixed and conditional iteration logic  
- To process database records row by row  
- To simulate real-world backend and business logic  
- To strengthen PL/pgSQL skills required for interviews and backend systems  

---

## Conceptual Overview

Looping constructs in PostgreSQL allow procedural execution of SQL statements. Unlike standard `SELECT` queries that work on sets, loops enable **row-level processing**, **conditional execution**, and **iterative logic**, which are essential in backend systems, payroll processing, auditing, and workflow engines.

PostgreSQL supports the following looping constructs:
- `FOR` loop
- `WHILE` loop
- `LOOP … EXIT WHEN`

---

## Practical / Experiment Steps

### Example 1: FOR Loop – Simple Iteration

```sql
do $$
declare
    i int;
begin
    for i in 1..5 loop
        raise notice 'Iteration number: %', i;
    end loop;
end;
$$;
```
<img width="246" height="226" alt="image" src="https://github.com/user-attachments/assets/8036a749-0b43-4f25-898d-1976af0d492b" />

### Example 2: FOR Loop with Query (Row-by-Row Processing)
```spl
do $$
declare
    emp_record record;
begin
    for emp_record in
        select emp_id, emp_name, salary from employee
    loop
        raise notice 'Employee: %, Salary: %',
        emp_record.emp_name, emp_record.salary;
    end loop;
end;
$$;
```
<img width="471" height="140" alt="image" src="https://github.com/user-attachments/assets/eaedd1a5-93ca-4c0c-90f4-585383505635" />

### Example 3: WHILE Loop – Conditional Iteration
```sql
do $$
declare
    v_count int := 0;
begin
    while v_count < 3 loop
        raise notice 'Validation attempt: %', v_count;
        v_count := v_count + 1;
    end loop;
end;
$$;
```
<img width="384" height="133" alt="image" src="https://github.com/user-attachments/assets/7e2e605f-b7ab-4206-a643-b5c69057a14c" />

### Example 4: LOOP with EXIT WHEN
```sql
do $$
declare
    v_count int := 0;
begin
    loop
        raise notice 'Checking schema iteration: %', v_count;
        if v_count = 2 then
            exit;
        end if;
        v_count := v_count + 1;
    end loop;
end;
$$;
```
<img width="465" height="140" alt="image" src="https://github.com/user-attachments/assets/4b70805b-e8e3-4262-bdc4-cd21915f1f42" />

### Example 5: Salary Increment Using FOR Loop
```sql
do $$
declare
    emp_record record;
begin
    for emp_record in
        select emp_id, salary from employee
    loop
        update employee
        set salary = salary + 2000
        where emp_id = emp_record.emp_id;
    end loop;
end;
$$;
```
**Before**
<img width="554" height="178" alt="image" src="https://github.com/user-attachments/assets/16a5562d-5133-446f-bbd5-3d3df7865eb6" />

**AFTER**
<img width="550" height="173" alt="image" src="https://github.com/user-attachments/assets/65f41c00-4e7f-42d5-9bc8-3c16b27b9251" />

### Example 6: Combining LOOP with IF Condition
```sql
do $$
declare
    order_rec record;
begin
    for order_rec in
        select customer_name, price from orders
    loop
        if order_rec.price > 50000 then
            raise notice 'High value order by %', order_rec.customer_name;
        else
            raise notice 'Normal order by %', order_rec.customer_name;
        end if;
    end loop;
end;
$$; 
```
<img width="723" height="298" alt="image" src="https://github.com/user-attachments/assets/0e619852-ecc7-4105-b8c0-5e6402b1dc6b" />
<img width="397" height="252" alt="image" src="https://github.com/user-attachments/assets/1307619e-134a-47ec-b59f-666891be5060" />

## Learning Outcomes
a.	Understanding of how iterative control structures work in PostgreSQL at a conceptual level. 
b.	Usage of loops in database systems, such as workflow engines, complex decision cycles, validation loops, etc.
c.	Foundational knowledge required for writing procedural logic in enterprise-grade applications.

