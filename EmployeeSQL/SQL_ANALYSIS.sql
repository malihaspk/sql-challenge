--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name,e.first_name,e.sex,s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,last_name, hire_date
FROM employees 
WHERE  hire_date >= '1/1/1986' 
AND hire_date < '1/1/1987';
 
--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT e.emp_no, m.dept_no,d.dept_name,e.first_name,e.last_name
FROM employees AS e
INNER JOIN dept_manager AS m
ON e.emp_no = m.emp_no
INNER JOIN departments AS d
ON m.dept_no = d.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT de.dept_no,e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees AS e
INNER JOIN department_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
From employees
Where first_name = 'Hercules' 
 AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT d.dept_name,e.emp_no,e.last_name,e.first_name
FROM employees AS e
INNER JOIN department_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT d.dept_name,e.emp_no,e.last_name,e.first_name
FROM employees AS e
INNER JOIN department_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development' ;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name , count(last_name) AS "employees_with_same_last_name"
From employees
GROUP BY last_name 
ORDER BY  "employees_with_same_last_name" DESC;