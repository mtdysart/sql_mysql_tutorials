USE employees;

SELECT COUNT(emp_no)
from employees;

SELECT count(DISTINCT first_name)
FROM employees;

SELECT COUNT(salary)
FROM salaries
WHERE salary > 100000;

# Returns number of records in table
SELECT COUNT(*)
FROM dept_manager;

SELECT first_name
FROM employees
GROUP BY first_name;

# GROUP BY must be placed directly after WHERE clause and before ORDER BY
SELECT first_name, COUNT(first_name)
FROM employees
GROUP BY first_name
ORDER BY first_name;

SELECT first_name, COUNT(first_name) AS names_count
FROM employees
GROUP BY first_name
ORDER BY first_name;

SELECT salary, COUNT(salary) AS emps_with_same_salary
FROM salaries
WHERE salary >= 80000
GROUP BY salary
ORDER BY salary;

