# Experiment 7 – Implementation of Different JOINS in SQL
---

## Student Details

- **Student Name:** Sumanyu Seth  
- **UID:** 25MCI10040  
- **Branch:** MCA (AI & ML)  
- **Section/Group:** 25MAM_KAR-1_A  
- **Semester:** II  
- **Date of Performance:** 24/03/26  
- **Subject Name:** Technical Training  
- **Subject Code:** 25CAP-652

---

## Experiment Aim

To understand and implement different types of SQL joins (INNER, LEFT, RIGHT, SELF, CROSS) in PostgreSQL for retrieving meaningful relationships between students, courses, and 
departments. 
---
## Objectives
- Demonstrate how INNER JOIN retrieves common records between tables. 
- Use LEFT JOIN to identify students without course enrollment. 
- Apply RIGHT JOIN to display all courses, even those without students. 
- Explore SELF JOIN / multiple joins to connect students with their department information. 
- Implement CROSS JOIN to generate all possible student-course combinations. 

---
### 1. Write queries to list students with their enrolled courses (INNER JOIN). 
```sql
SELECT s.student_id, s.student_name, c.course_name 
FROM students s 
INNER JOIN enrollments e ON s.student_id = e.student_id 
INNER JOIN courses c ON e.course_id = c.course_id; 
```

<img width="684" height="256" alt="image" src="https://github.com/user-attachments/assets/45127c38-b356-478b-b6c1-61648a85454d" />


### 2.	Find students not enrolled in any course (LEFT JOIN).
```sql
SELECT s.student_id, s.student_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.course_id IS NULL;
```
<img width="458" height="146" alt="image" src="https://github.com/user-attachments/assets/5bbf3f45-b306-487d-b881-cc63ea343b52" />

### 3.	Display all courses with or without enrolled students (RIGHT JOIN).
```sql
SELECT c.course_id, c.course_name, s.student_name
FROM students s
RIGHT JOIN enrollments e ON s.student_id = e.student_id
RIGHT JOIN courses c ON e.course_id = c.course_id;
```
<img width="679" height="295" alt="image" src="https://github.com/user-attachments/assets/b7f49d00-7ce4-4b8f-84cb-2c421ae09171" />

### 4.	Show students with department info using SELF JOIN or multiple joins.
```sql
SELECT s.student_id, s.student_name, d.department_name
FROM students s
INNER JOIN departments d ON s.department_id = d.department_id; 
```

<img width="635" height="275" alt="image" src="https://github.com/user-attachments/assets/f2d5d7ac-a06b-4912-85ce-086d07ba709b" />

### 5.	Display all possible student-course combinations (CROSS JOIN).
```sql
SELECT s.student_name, c.course_name
FROM students s
CROSS JOIN courses c;
```
| student_name | course_name        |
|--------------|--------------------|
| Alice        | Database Systems   |
| Bob          | Database Systems   |
| Charlie      | Database Systems   |
| David        | Database Systems   |
| Eva          | Database Systems   |
| Frank        | Database Systems   |
| Alice        | Operating Systems  |
| Bob          | Operating Systems  |
| Charlie      | Operating Systems  |
| David        | Operating Systems  |
| Eva          | Operating Systems  |
| Frank        | Operating Systems  |
| Alice        | Thermodynamics     |
| Bob          | Thermodynamics     |
| Charlie      | Thermodynamics     |
| David        | Thermodynamics     |
| Eva          | Thermodynamics     |
| Frank        | Thermodynamics     |
| Alice        | Circuit Analysis   |
| Bob          | Circuit Analysis   |
| Charlie      | Circuit Analysis   |
| David        | Circuit Analysis   |
| Eva          | Circuit Analysis   |
| Frank        | Circuit Analysis   |
| Alice        | Marketing 101      |
| Bob          | Marketing 101      |
| Charlie      | Marketing 101      |
| David        | Marketing 101      |
| Eva          | Marketing 101      |
| Frank        | Marketing 101      |

### Learning Outcomes: 
-	Gain practical knowledge of different SQL joins (INNER, LEFT, RIGHT, SELF, CROSS).
-	Learn how to retrieve, combine, and analyze data across multiple tables.
-	Develop skills to identify missing or related data using joins.
