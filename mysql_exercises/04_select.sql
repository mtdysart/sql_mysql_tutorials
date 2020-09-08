USE employees;

SELECT first_name, last_name 
FROM employees.employees;

SELECT * FROM employees;

SELECT dept_no FROM departments;
SELECT * FROM departments;

SELECT * 
FROM employees
WHERE first_name = "Denis";

SELECT *
FROM employees
WHERE first_name = "Elvis";

SELECT *
FROM employees
WHERE first_name = "Denis" AND gender = "M";

SELECT * 
FROM employees
WHERE first_name = "Kellie" AND gender = "F";

SELECT * 
FROM employees
WHERE first_name = "Elvis" OR first_name = "Denis";

SELECT *
FROM employees
WHERE first_name = "Kellie" OR first_name = "Aruna";
