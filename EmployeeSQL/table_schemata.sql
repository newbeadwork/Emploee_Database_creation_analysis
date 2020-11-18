CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY(dept_no)
);

SELECT *
FROM departments;

CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY(title_id)
);

SELECT *
FROM titles;

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex CHAR NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);
	
SELECT *
FROM employees;

SELECT COUNT (DISTINCT emp_no)
FROM employees;

SELECT COUNT(emp_no)
FROM employees;

--As both operations give us the same number (300024) we can be sure,
--that employee number (emp_no) is unique value and may be used as a primary key.

ALTER TABLE employees
ADD PRIMARY KEY (emp_no);

CREATE TABLE dept_employees (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT *
FROM dept_employees;

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT *
FROM dept_manager;

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary MONEY NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT *
FROM salaries;

