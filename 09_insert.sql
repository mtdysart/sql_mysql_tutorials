USE employees;

INSERT INTO employees (
	emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
)
VALUES (
	999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
);

SELECT *
FROM employees
ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO employees
VALUES (
	999903,
    '1997-09-14',
    'Johnathon',
    'Creek',
    'M',
    '1999-01-01'
);

SELECT *
FROM titles
LIMIT 10;

INSERT INTO titles (
	emp_no,
    title,
    from_date
)
VALUES (
	999903,
    'Senior Engineer',
    '1997-10-01'
);

INSERT INTO dept_emp
VALUES (
	999903,
    'd005',
    '1997-10-01',
    '9999-01-01'
);

INSERT INTO departments
VALUES (
	'd010',
    'Business Analysis'
);

SELECT * FROM departments;