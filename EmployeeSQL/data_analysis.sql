--Listing the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no;


--Listing first name, last name, and hire date for employees who were hired in 1986.
SELECT  first_name, last_name, hire_date
FROM    employees
WHERE   hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--Listing the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT  dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM    employees e
INNER JOIN dept_manager dm ON 
e.emp_no = dm.emp_no
INNER JOIN departments d ON 
dm.dept_no = d.dept_no;


--Listing the department of each employee with the following information: employee number, last name, first name, and department name.
--Using "Create view" function for purpose extract information from this view in future tasks.
CREATE OR REPLACE VIEW employees_department AS
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM    employees e
INNER JOIN dept_employees de ON 
e.emp_no = de.emp_no
INNER JOIN departments d ON 
de.dept_no = d.dept_no;

SELECT *
FROM employees_department;


--Listing first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--Listing all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT *
FROM employees_department
WHERE dept_name = 'Sales';


--Listing all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT *
FROM employees_department
WHERE dept_name = 'Sales' OR dept_name = 'Development';


--In descending order, listing the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT (last_name) DESC;
