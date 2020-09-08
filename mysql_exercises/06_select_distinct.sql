USE employees;

SELECT DISTINCT hire_date
FROM employees;

# Default is ASC
SELECT *
FROM employees
ORDER BY first_name ASC;

SELECT *
FROM employees
ORDER BY first_name DESC;

SELECT *
FROM employees
ORDER BY emp_no DESC;

SELECT *
FROM employees
ORDER BY first_name, last_name ASC;

SELECT *
FROM employees
ORDER BY hire_date DESC;

