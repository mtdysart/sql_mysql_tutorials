USE employees;

SELECT emp_no, from_date, to_date, COUNT(emp_no) AS Num
FROM dept_emp
GROUP BY emp_no
HAVING Num > 1;

# View with latest from and to date
# Views are temporary virtual data tables, not real data
CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
SELECT emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
FROM dept_emp
GROUP BY emp_no;

CREATE OR REPLACE VIEW v_average_manager_salary AS
SELECT ROUND(AVG(s.salary), 2) AS average_salary
FROM dept_manager d JOIN salaries s 
ON d.emp_no = s.emp_no;

