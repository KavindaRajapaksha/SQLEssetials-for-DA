DROP DATABASE IF EXISTS `Parks_and_Recreation`;
CREATE DATABASE `Parks_and_Recreation`;
USE `Parks_and_Recreation`;

CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE,
  PRIMARY KEY (employee_id)
);

CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);
CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE,
  PRIMARY KEY (employee_id)
);

CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);


INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Leslie', 'Knope', 44, 'Female','1979-09-25'),
(3,'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000,1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000,1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000,1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000,1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000,1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000,1),
(7, 'Ann', 'Perkins', 'Nurse', 55000,4),
(8, 'Chris', 'Traeger', 'City Manager', 90000,3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000,6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000,1);



CREATE TABLE parks_departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name varchar(50) NOT NULL,
  PRIMARY KEY (department_id)
);

INSERT INTO parks_departments (department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');

SELECT * FROM employee_demographics;
SELECT first_name FROM employee_demographics;
SELECT age,age+10 FROM employee_demographics;

SELECT DISTINCT(gender) FROM employee_demographics;
SELECT *
FROM employee_salary
WHERE salary > 50000;

SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM employee_demographics
WHERE gender = 'Female';
SELECT *
FROM employee_demographics
WHERE gender != 'Female';


SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';

SELECT *
FROM employee_demographics
WHERE first_name='Andy' AND age='34';


SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';

-- after two char
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';

SELECT gender
FROM employee_demographics
GROUP BY gender;

SELECT gender,avg(age)
FROM employee_demographics
GROUP BY gender;

SELECT occupation,salary
FROM employee_salary
GROUP BY occupation,salary;

SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age)
FROM employee_demographics
GROUP BY gender
;

SELECT * 
FROM employee_demographics
order by first_name;

SELECT * 
FROM employee_demographics
order by gender DESC;
-- group and order execute first
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

SELECT occupation,AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary)>75000;

SELECT *
FROM employee_demographics
LIMIT 3;

SELECT *
FROM employee_demographics
ORDER BY first_name DESC
LIMIT 3;

SELECT *
FROM employee_demographics
ORDER BY first_name;

SELECT first_name 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

SELECT first_name 
FROM employee_demographics
ORDER BY age DESC
LIMIT 2,1;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;
-- we can use the keyword AS to specify we are using an Alias
SELECT gender, AVG(age) AS Avg_age
FROM employee_demographics
GROUP BY gender
;

-- although we don't actually need it, but it's more explicit which I usually like
SELECT gender, AVG(age) Avg_age
FROM employee_demographics
GROUP BY gender
;

-- Joins
SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;

SELECT *
FROM  employee_demographics
INNER JOIN employee_salary
ON  employee_demographics.employee_id= employee_salary.employee_id
;

SELECT  dem.first_name,sal.salary
FROM  employee_demographics AS dem
INNER JOIN employee_salary AS sal
ON  dem.employee_id= sal.employee_id
;

SELECT *
FROM  employee_demographics AS dem
LEFT JOIN employee_salary AS sal
ON  dem.employee_id= sal.employee_id
;
SELECT *
FROM  employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
ON  dem.employee_id= sal.employee_id
;

-- self join

SELECT *
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
ON emp1.employee_id+1=emp2.employee_id  ;

SELECT emp1.employee_id AS emp_santa,
emp2.first_name AS first_name_santa,
emp2.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
ON emp1.employee_id+1=emp2.employee_id  ;

-- joinning multiple table

SELECT  *
FROM  employee_demographics AS dem
INNER JOIN employee_salary AS sal
ON  dem.employee_id= sal.employee_id
;

SELECT * 
FROM parks_departments;

SELECT  *
FROM  employee_demographics AS dem
INNER JOIN employee_salary AS sal
ON  dem.employee_id= sal.employee_id
INNER JOIN parks_departments AS dep
ON dep.department_id=sal.dept_id
;

SELECT first_name,last_name
FROM employee_demographics
UNION ALL
SELECT first_name,last_name
FROM employee_salary;

SELECT first_name,last_name,'OLD' AS Lable
FROM employee_demographics
WHERE age>50
UNION
SELECT first_name,last_name,'Highly paid' AS Lable
FROM employee_salary
WHERE salary>70000;

SELECT first_name, last_name, 'Old Lady' as Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Old Man'
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Highly Paid Employee'
FROM employee_salary
WHERE salary >= 70000
ORDER BY first_name
;
-- String functions
 
SELECT LENGTH('Kavinda') AS name_length;

SELECT first_name, LENGTH(first_name)AS name_length
FROM employee_salary
ORDER BY 2 DESC;

SELECT UPPER('Kavinda');
SELECT LOWER('Kavinda');

SELECT TRIM('     ks    ');
SELECT LTRIM('     ks    ');
SELECT RTRIM('     ks    ');


SELECT * 
FROM employee_demographics;

SELECT first_name ,LEFT(first_name,4),RIGHT(first_name,4),SUBSTRING(first_name,3,2),birth_date,SUBSTRING(birth_date,6,2) AS birth_month
FROM employee_demographics;

SELECT first_name,REPLACE(first_name,'a','KAVINDA')
 FROM employee_demographics;
 
 SELECT first_name ,LOCATE('An',first_name) AS name_with_an
 FROM employee_demographics;
 
 SELECT first_name,last_name,CONCAT(first_name,' ',last_name) AS full_name
  FROM employee_demographics;

-- case statements

SELECT first_name, last_name,age,
CASE
   WHEN age<= 30 THEN 'YOUNG'
   WHEN age BETWEEN 31 AND 50 THEN 'OLD'
   WHEN age >50 THEN 'OLDEST'
   END AS age_lable
FROM employee_demographics;

SELECT CONCAT(first_name,' ', last_name)AS full_name, salary,
CASE
	WHEN salary > 45000 THEN salary + (salary * 0.05)
    WHEN salary < 45000 THEN salary + (salary * 0.07)
END AS new_salary, 
Case
   WHEN salary > 45000 THEN (salary * 0.05)
    WHEN salary < 45000 THEN (salary * 0.07) 
    END AS salary_increase
FROM employee_salary;
-- sub queries

SELECT * 
FROM employee_demographics
WHERE employee_id IN (
SELECT employee_id FROM employee_salary
where dept_id=1
);


SELECT first_name, salary, AVG(salary)
FROM employee_salary;

SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name, salary;


SELECT first_name, 
salary, 
(SELECT AVG(salary) 
	FROM employee_salary)
FROM employee_salary;

SELECT *
FROM (SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age)
FROM employee_demographics
GROUP BY gender) AS Agg_Table
;
-- now this doesn't work because we get an error saying we have to name it

SELECT gender, AVG(Min_age)
FROM (SELECT gender, MIN(age) Min_age, MAX(age) Max_age, COUNT(age) Count_age ,AVG(age) Avg_age
FROM employee_demographics
GROUP BY gender) AS Agg_Table
GROUP BY gender
;

-- Window functions

SELECT gender,AVG(salary) AS avg_sal 
FROM employee_demographics AS dem
JOIN employee_salary AS sal
ON dem.employee_id=sal.employee_id
GROUP BY gender;

SELECT gender,AVG(salary) OVER(partition by gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
ON dem.employee_id=sal.employee_id
;
SELECT * 
FROM employee_demographics;

-- first let's look at group by
SELECT gender, ROUND(AVG(salary),1)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

-- now let's try doing something similar with a window function

SELECT dem.employee_id, dem.first_name, gender, salary,
AVG(salary) OVER()
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- now we can add any columns and it works. We could get this exact same output with a subquery in the select statement, 
-- but window functions have a lot more functionality, let's take a look


-- if we use partition it's kind of like the group by except it doesn't roll up - it just partitions or breaks based on a column when doing the calculation

SELECT dem.employee_id, dem.first_name, gender, salary,
AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


-- now if we wanted to see what the salaries were for genders we could do that by using sum, but also we could use order by to get a rolling total

SELECT dem.employee_id, dem.first_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY employee_id)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;


-- Let's look at row_number rank and dense rank now


SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- let's  try ordering by salary so we can see the order of highest paid employees by gender
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary desc)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- let's compare this to rank
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary desc) row_num,
Rank() OVER(PARTITION BY gender ORDER BY salary desc) rank_1 
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- notice rank repeats on tom ad jerry at 5, but then skips 6 to go to 7 -- this goes based off positional rank


-- let's compare this to dense rank
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary desc) row_num,
Rank() OVER(PARTITION BY gender ORDER BY salary desc) rank_1,
dense_rank() OVER(PARTITION BY gender ORDER BY salary desc) dense_rank_2 -- this is numerically ordered instead of positional like rank
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;
