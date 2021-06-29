

/* Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name.
In your comments, answer: 

What was the first and last name in the first row of the results? Irena Reutenauer
What was the first and last name of the last person in the table? Vidya Simmen
*/

SELECT *
FROM employees
WHERE first_name in('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

/* Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 
In your comments, answer: 

What was the first and last name in the first row of the results? Irena Acton
What was the first and last name of the last person in the table? Vidya Zweizig
*/

SELECT *
FROM employees
WHERE first_name in('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

/* Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. 
In your comments, answer: 

What was the first and last name in the first row of the results? Irena Acton
What was the first and last name of the last person in the table? Maya Zyda
*/

SELECT *
FROM employees
WHERE first_name in('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;


/* Write a query to to find all employees whose last name starts and ends with 'E'. 
Sort the results by their employee number. 

Enter a comment with the number of employees returned.   899 
the first employee number and their first and last name  Rmzi Erder
the last employee number with their first and last name  Tadahiro Erde
*/

SELECT *
FROM employees
WHERE last_name like '%E' and last_name like 'E%'
ORDER BY emp_no;


/* Write a query to to find all employees whose last name starts and ends with 'E'. 
Sort the results by their hire date, so that the newest employees are listed first. 

Enter a comment with the number of employees returned  899
the name of the newest employee TAIJI ELDRIDGE
the name of the oldest emmployee SERGI ERDE
*/

SELECT *
FROM employees
WHERE last_name like '%E' and last_name like 'E%'
ORDER BY hire_date DESC;

/* Find all employees hired in the 90s and born on Christmas. 
Sort the results so that the oldest employee who was hired last is the first result. 

Enter a comment with the number of employees returned 362
the name of the oldest employee who was hired last Khun Bernini
the name of the youngest emmployee who was hired first. Douadi Pettis
*/

SELECT *
FROM employees
Where hire_date like '199%' and birth_date like '%12-25'
ORDER BY birth_date, hire_date DESC;


/* Write a query to to find all employees whose last name starts and ends with 'E'. 
Use concat() to combine their first and last name together as a single column named full_name. */

use employees;
SELECT concat(first_name, " ", last_name) as full_name
FROM employees
WHERE last_name like '%E' and last_name like 'E%';

/* Convert the names produced in your last query to all uppercase. */

use employees;
SELECT UPPER(CONCAT(first_name, " ", last_name)) AS full_name
FROM employees
WHERE last_name LIKE '%E' AND last_name like 'E%';

/* Find all employees hired in the 90s and born on Christmas. 
Use datediff() function to find how many days they have been working at the company 
(Hint: You will also need to use NOW() or CURDATE()), */

SELECT last_name, first_name, birth_date, hire_date, datediff(now(), hire_date) AS totaldays
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';


/* Find the smallest and largest current salary from the salaries table. */

SELECT min(salary) as min_sal, max(salary) as max_sal
FROM salaries;


/* Use your knowledge of built in SQL functions to generate a username for all of the employees. 
A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. 
Below is an example of what the first 10 rows will look like: */

USE employees;
SELECT LOWER(
CONCAT(SUBSTR(first_name, 1, 1), 
SUBSTR(last_name, 1, 4), "-", 
SUBSTR(birth_date, 6, 2), 
SUBSTR(birth_date, 3, 2))) as username, 
first_name, last_name, birth_date
FROM employees;



