USE employees;

# AND operator takes precedence before OR: Result is all females in the table and also males named Denis
SELECT * 
FROM employees
WHERE last_name = "Denis" AND gender = "M" OR gender = "F";

# All employees named Denis who are either male or female
SELECT *
FROM employees
WHERE last_name = "Denis" AND (gender = "M" OR gender = "F");

SELECT *
FROM employees
WHERE gender = "F" AND (first_name = "Kellie" OR first_name = "Aruna");

# More efficient than 3 OR's
SELECT *
FROM employees
WHERE first_name IN ("Cathie", "Nathan", "Mark");

SELECT *
FROM employees
WHERE first_name NOT IN ("John", "Mark", "Jacob");

# Pattern matching
# All employees whose first name begins with "Mar"
SELECT *
FROM employees
WHERE first_name LIKE("Mar%");

SELECT *
FROM employees
WHERE first_name LIKE("%ar%");

SELECT *
FROM employees
WHERE first_name LIKE("Mar_");

SELECT *
FROM employees
WHERE first_name LIKE("Mark%");

SELECT *
FROM employees
WHERE hire_date LIKE("2000%");

SELECT * 
FROM employees
WHERE emp_no LIKE("_1000");