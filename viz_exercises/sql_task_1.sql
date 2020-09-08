# Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990. 
USE employees_mod;

CREATE OR REPLACE VIEW yearly_gender_breakdown AS
SELECT YEAR(de.from_date) AS calendar_year, e.gender, COUNT(e.emp_no) AS num_of_employees
FROM t_dept_emp de JOIN t_employees e ON de.emp_no = e.emp_no
WHERE de.from_date >= '1990-01-01'
GROUP BY calendar_year, e.gender
ORDER BY calendar_year;

SELECT * FROM yearly_gender_breakdown;
