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

# Note: BETWEEN is inclusive
SELECT *
FROM employees
WHERE hire_date BETWEEN "1990-01-01" AND "2000-01-01";

SELECT *
FROM salaries
WHERE salary BETWEEN 66000 AND 70000;

SELECT *
FROM employees
WHERE emp_no NOT BETWEEN 10004 AND 10012;

SELECT dept_name
FROM departments
WHERE dept_no BETWEEN "d003" AND "d006";

SELECT *
FROM employees
WHERE first_name IS NULL;

SELECT dept_name
FROM departments
WHERE dept_no IS NOT NULL;

SELECT * 
FROM employees
WHERE hire_date > "2000-01-01";

SELECT *
FROM employees
WHERE gender = "F" AND hire_date >= "2000-01-01";

SELECT salary
FROM salaries
WHERE salary > 150000;