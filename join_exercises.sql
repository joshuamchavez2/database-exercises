
USE join_example_db;


/* Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
 */
USE employees;

SELECT dept_name, concat(first_name, " ", last_name) AS "Full Name" -- Selecting department Name and concating first and last name with a space

FROM employees -- Include employees
JOIN dept_manager -- Join department managers table
	ON dept_manager.emp_no = employees.emp_no -- link with emp_no
JOIN dept_emp -- Join department employees table
	ON dept_emp.emp_no = employees.emp_no-- link with emp_no
JOIN departments -- Join departments 
	ON departments.dept_no = dept_emp.dept_no -- link with dept_no

WHERE dept_manager.to_date > now() -- Looking for only the current department managers.  
ORDER BY dept_name;
/* Find the name of all departments currently managed by women. */

SELECT dept_name, concat(first_name, " ", last_name) AS "Full Name", employees.emp_no, dept_manager.to_date, gender
FROM employees
JOIN dept_manager 
	ON dept_manager.emp_no = employees.emp_no
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE (dept_manager.to_date > now()) AND gender = 'F';

/* Find the current titles of employees currently working in the Customer Service department. */

SELECT title, count(*)
FROM employees
JOIN titles 
	ON titles.emp_no = employees.emp_no
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no

WHERE (titles.to_date > now()) AND (departments.dept_name = 'Customer Service')
GROUP BY title
ORDER BY title;

/* Find the current salary of all current managers. */

USE employees;

SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, " ", employees.last_name) AS "Name", salary as "Salary"
FROM employees
JOIN salaries
	ON salaries.emp_no = employees.emp_no
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
JOIN dept_manager 
	ON dept_manager.emp_no = employees.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE (dept_manager.to_date > now()) and (salaries.to_date > now())
ORDER BY dept_name;

/* Find the number of current employees in each department. */
SELECT  departments.dept_no, departments.dept_name, count(departments.dept_name) AS "Num_employees"
FROM employees
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date > now()
GROUP BY departments.dept_name
ORDER BY dept_no;

/* Which department has the highest average salary? Hint: Use current not historic information. */

SELECT departments.dept_name as "dept_name", AVG(salary) AS 'average_salary'
FROM employees 
JOIN salaries
	ON salaries.emp_no = employees.emp_no
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE salaries.to_date > now()
Group BY departments.dept_name
ORDER BY average_salary DESC
LIMIT 1;

/* Who is the highest paid employee in the Marketing department? */

SELECT MAX(salary) AS 'highest_paid', first_name, last_name
FROM employees 
JOIN salaries
	ON salaries.emp_no = employees.emp_no
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE (salaries.to_date > now()) 
	AND (departments.dept_name = 'Marketing') 
	AND (dept_emp.to_date > now())
GROUP BY first_name, last_name
ORDER BY highest_paid DESC
LIMIT 1;

/* Which current department manager has the highest salary? */

SELECT first_name, last_name, MAX(salary) AS 'salary'
FROM employees 
JOIN salaries
	ON salaries.emp_no = employees.emp_no
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
JOIN departments
	ON departments.dept_no = dept_emp.dept_no
JOIN dept_manager 
	ON dept_manager.emp_no = employees.emp_no
WHERE (salaries.to_date > now()) 
	AND (dept_manager.to_date > now())
GROUP BY first_name, last_name
ORDER BY salary DESC
LIMIT 1;
	
