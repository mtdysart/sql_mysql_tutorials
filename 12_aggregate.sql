USE employees;

SELECT COUNT(DISTINCT from_date)
FROM salaries;

# Number of records in table
SELECT COUNT(*)
FROM salaries;

SELECT COUNT(DISTINCT dept_no)
FROM dept_emp;

SELECT SUM(salary) FROM salaries;

SELECT SUM(salary)
FROM salaries
WHERE from_date > '1997-01-01';

SELECT MAX(salary) FROM salaries;
SELECT MIN(salary) FROM salaries;

SELECT MAX(emp_no) FROM employees;
SELECT MIN(emp_no) FROM employees;

SELECT AVG(salary)
FROM salaries
WHERE from_date > '1997-01-01';

# Round to closest integer
SELECT round(AVG(salary))
FROM salaries
WHERE from_date > '1997-01-01';

# Round to two decimal places
SELECT round(AVG(salary), 2)
FROM salaries
WHERE from_date > '1997-01-01';

