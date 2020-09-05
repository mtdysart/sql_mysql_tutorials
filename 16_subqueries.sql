USE employees;

# Place subqueries in parenthesis
SELECT e.first_name, e.last_name
FROM employees e
WHERE e.emp_no
IN (SELECT emp_no FROM dept_manager);

SELECT *
FROM dept_manager d
WHERE d.emp_no IN (SELECT e.emp_no  FROM employees e WHERE e.hire_date BETWEEN '1990-01-01' AND '1995-01-01');

# EXISTS quicker for large datasets, IN quicker for smaller data
SELECT e.first_name, e.last_name
FROM employees e
WHERE EXISTS (SELECT * FROM dept_manager dm WHERE e.emp_no = dm.emp_no)
ORDER BY e.emp_no;

SELECT *
FROM employees e
WHERE EXISTS (SELECT t.emp_no FROM titles t WHERE t.title = 'Assistant Engineer' AND e.emp_no = t.emp_no);

SELECT A.* FROM (SELECT e.emp_no AS employee_id, MIN(de.dept_no) AS department_code, (SELECT emp_no FROM dept_manager WHERE emp_no = 110022) AS manager_id
FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no) AS A
UNION 
SELECT B.* FROM (SELECT e.emp_no AS employee_id, MIN(de.dept_no) AS department_code, (SELECT emp_no FROM dept_manager WHERE emp_no = 110039) AS manager_id
FROM employees e JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no > 10020 
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 20) AS B;

DROP TABLE IF EXISTS emp_manager;

CREATE TABLE emp_manager (
	emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);



