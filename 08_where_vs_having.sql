USE employees;

# HAVING must be after GROUP BY and before ORDER BY
# HAVING gives a condition for an aggregate function, but WHERE can not be used for aggregate functions

# Returns names and counts for names which are encountered more than 250 times
SELECT first_name, COUNT(first_name) AS name_counts
FROM employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

SELECT emp_no, AVG(salary) AS avg_salary
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

# Cannot have aggregated and non-aggregated in HAVING clause
SELECT first_name, COUNT(first_name) AS name_counts
FROM employees
WHERE hire_date > "1999-01-01"
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name;

SELECT emp_no, COUNT(from_date) AS num_of_contracts
FROM dept_emp
WHERE from_date > "2000-01-01"
GROUP BY emp_no
HAVING COUNT(from_date) > 1;