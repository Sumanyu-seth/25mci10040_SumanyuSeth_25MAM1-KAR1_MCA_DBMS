CREATE TABLE Students (
    student_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    percentage DECIMAL(5,2)
);

INSERT INTO Students VALUES
(1, 'Amit', 'Delhi', 96.5),
(2, 'Riya', 'Mumbai', 94.2),
(3, 'Rahul', 'Delhi', 97.8),
(4, 'Sneha', 'Mumbai', 98.1),
(5, 'Ankit', 'Chandigarh', 95.6),
(6, 'Pooja', 'Delhi', 93.4),
(7, 'Karan', 'Chandigarh', 96.2);

------- i. Without case statement -------
SELECT city, COUNT(*) AS student_counts FROM students 
WHERE percentage > 95
GROUP BY city ;

------ i. With case statement ------
SELECT city, SUM(CASE WHEN percentage>95 THEN 1 ELSE 0 END) AS student_counts 
FROM students GROUP BY city ;

------ ii. Without case statement ------
SELECT city, avg(percentage) AS avg FROM students where percentage>95 group by city;

------ ii. With case statement ------
SELECT city, AVG(CASE WHEN percentage>95 THEN percentage ELSE null END) AS avg_percentage 
FROM students GROUP BY city ORDER BY avg_percentage desc ;