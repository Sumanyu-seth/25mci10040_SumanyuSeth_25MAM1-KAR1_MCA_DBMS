# Experiment 2: SELECT Queries with Filtering, Grouping, and Sorting

## Student Information

- **Student Name:** Sumanyu Seth  
- **UID:** 25MCI10040  
- **Branch:** MCA (AI & ML)  
- **Section/Group:** 25MAM_KAR-1_A  
- **Semester:** II  
- **Subject Name:** Technical Training  
- **Subject Code:** 25CAP-652  
- **Date of Performance:** 20/01/26  

---

## Title

Implementation of SELECT Queries with Filtering, Grouping and Sorting in PostgreSQL

---

## Aim

To implement and analyze SQL SELECT queries using filtering, sorting, grouping, and aggregation concepts in PostgreSQL for efficient data retrieval and analytical reporting.

---

## Objectives

- To retrieve specific data using filtering conditions  
- To sort query results using single and multiple attributes  
- To perform aggregation using grouping techniques  
- To apply conditions on aggregated data  
- To understand real-world analytical queries commonly asked in placement interviews  

---

## Practical

### Step 1: Database and Table Preparation

```sql
create table orders (

    order_id serial primary key,

    customer_name varchar(50),

    product varchar(50),

    quantity int,

    price numeric(10,2),

    order_date date

);

insert into orders (customer_name, product, quantity, price, order_date) values

('amit', 'laptop', 1, 65000, '2024-01-10'),

('neha', 'mobile', 2, 40000, '2024-01-12'),

('rohan', 'tablet', 1, 25000, '2024-01-15'),

('simran', 'laptop', 1, 70000, '2024-01-18'),

('ankit', 'mobile', 3, 60000, '2024-01-20'),

('pooja', 'headphones', 2, 5000, '2024-01-22'),

('rahul', 'tablet', 2, 48000, '2024-01-25');
```

### Step 2: Filtering Data Using Conditions
```sql
select * from orders where price > 50000;
```
<img width="500" height="80" alt="image" src="https://github.com/user-attachments/assets/ce61fe68-806f-4bda-9750-6bba1f94b765" />

```sql
select customer_name, product, price from orders where price > 30000 and quantity >= 2;
```
<img width="350" height="80" alt="image" src="https://github.com/user-attachments/assets/adba5020-32ae-4b75-a00c-30ef8661f425" />


### Step 3: Sorting Query Results
```sql
select customer_name, product, price from orders order by price asc;
select customer_name, product, price from orders order by price desc;
select customer_name, product, price, quantity from orders order by product asc, price desc;
```
<img width="400" height="150" alt="image" src="https://github.com/user-attachments/assets/0be98ee8-65bc-4032-8c4e-9c55d7a33fcf" />


### Step 4: Grouping Data for Aggregation
```sql
select product, sum(price) as total_sales from orders group by product;
select product, sum(quantity) as total_quantity from orders group by product;
```
<img width="200" height="100" alt="image" src="https://github.com/user-attachments/assets/de38f0c6-9393-465b-890d-b38ec444a1e6" />
<img width="230" height="110" alt="image" src="https://github.com/user-attachments/assets/ee3500e4-e837-4670-974a-07c674e6258d" />

### Step 5: Applying Conditions on Aggregated Data
```sql
select product, sum(price) as total_sales from orders group by product having sum(price) > 50000;
```
<img width="441" height="173" alt="image" src="https://github.com/user-attachments/assets/5f76aa0b-f816-4b80-ad4d-f19df0b18c1f" />

### Step 6: Conceptual Understanding of Filtering vs Aggregation Conditions
```sql
select product, sum(price) from orders group by product having sum(price) > 50000;
```
<img width="419" height="175" alt="image" src="https://github.com/user-attachments/assets/f789d87e-b420-4868-b105-3923f40ea39a" />

## Learning Outcomes

- Understand how conditional filtering is used to retrieve only relevant records from a database.
- Explain how sorting enhances the readability and usefulness of query results in reports.
- Apply grouping techniques to organize data for analytical and summary purposes.
- Distinguish clearly between row-level conditions and group-level conditions using appropriate SQL clauses.
- Develop confidence in writing analytical SQL queries applicable to real-world database scenarios.
- Demonstrate improved readiness for placement and interview questions related to filtering, grouping, and aggregation concepts.
