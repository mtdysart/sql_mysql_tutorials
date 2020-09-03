USE employees;

# First, need to do some setup

ALTER TABLE departments_dup
DROP COLUMN dept_manager;

SELECT * FROM departments_dup;

ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

DELETE FROM departments_dup
WHERE dept_no = 'd002' OR dept_no = 'd010' OR dept_no = 'd011';

DROP TABLE IF EXISTS dept_manager_dup;

DELETE FROM departments_dup
WHERE dept_name = 'Public Relations';

INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');

INSERT INTO departments_dup (dept_no)
VALUES ('d010'), ('d011');

CREATE TABLE dept_manager_dup (
	emp_no int(11) NOT NULL,
	dept_no char(4) NULL,
	from_date date NOT NULL,
	to_date date NULL
 );
 
INSERT INTO dept_manager_dup
select * from dept_manager;

SELECT * FROM dept_manager_dup;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES (999904, '2017-01-01'),
		(999905, '2017-01-01'),
        (999906, '2017-01-01'),
        (999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';

INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');

DELETE FROM departments_dup
WHERE dept_no = 'd002';

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

# For INNER JOIN, non-matching values will not appear in result set 

SELECT M.dept_no, M.emp_no, D.dept_name
FROM dept_manager_dup M INNER JOIN departments_dup D
ON M.dept_no = D.dept_no
ORDER BY M.dept_no;

# Default is INNER JOIN
SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM employees e JOIN dept_manager d
ON e.emp_no = d.emp_no
ORDER BY emp_no;

# For LEFT JOIN, all records from left table appear in result set
SELECT M.dept_no, M.emp_no, D.dept_name
FROM dept_manager_dup M LEFT JOIN departments_dup D
ON M.dept_no = D.dept_no
GROUP BY M.emp_no
ORDER BY M.dept_no;

SELECT D.dept_no, M.emp_no, D.dept_name
FROM departments_dup D LEFT JOIN dept_manager_dup M
ON M.dept_no = D.dept_no
ORDER BY D.dept_no;

# Returns records in left table with no matching data in right table
SELECT M.dept_no, M.emp_no, D.dept_name
FROM dept_manager_dup M LEFT JOIN departments_dup D
ON M.dept_no = D.dept_no
WHERE dept_name IS NULL
ORDER BY M.dept_no;

SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
FROM employees e LEFT JOIN dept_manager dm
ON e.emp_no = dm.emp_no
WHERE e.last_name = 'Markovitch'
ORDER BY dept_no DESC, emp_no;

SELECT D.dept_no, M.emp_no, D.dept_name
FROM dept_manager_dup M RIGHT JOIN departments_dup D
ON M.dept_no = D.dept_no
ORDER BY D.dept_no;

select * from departments_dup;