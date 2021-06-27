

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







