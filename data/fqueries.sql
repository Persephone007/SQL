DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

--dept_no	dept_name


CREATE TABLE departments (
  dept_no character varying(30) NOT NULL,
  dept_name character varying(45) NOT NULL
);

--emp_no	dept_no	from_date	to_date

CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no character varying(30) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL 
);

--dept_no	emp_no	from_date	to_date

CREATE TABLE dept_manager (
  dept_no character varying(30) NOT NULL,
  emp_no integer NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);

--emp_no	birth_date	first_name	last_name	gender	hire_date

CREATE TABLE employees (
   emp_no integer NOT NULL,
   birth_date DATE NOT NULL,
   first_name character varying(45) NOT NULL,
   last_name character varying(45) NOT NULL,
   gender character varying(15) NOT Null,
   hire_date DATE NOT NULL
);

--emp_no	salary	from_date	to_date


CREATE TABLE salaries (
  emp_no integer NOT NULL,
  salary MONEY NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL
);

--emp_no	title	from_date	to_date


CREATE TABLE titles (
  emp_no integer NOT NULL,
  title character varying(45) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL  
);


-- details of each employee: employee number, last name, first name, gender, and salary.
--join employees + salaries

SELECT employees.emp_no,
employees.birth_date,
employees.first_name,	
employees.last_name,	
employees.gender,
employees.hire_date,
salaries.emp_no,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--List employees who were hired in 1986.****************
SELECT *
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '01/01/1987';

--manager of each department with the following information
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates
--dept_no	emp_no	from_date	to_date   >>dept_manager
--dept_no	dept_name >>departments
--emp_no	birth_date	first_name	last_name	gender	hire_date >>employees

SELECT dept_manager.dept_no,
dept_manager.emp_no,
dept_manager.from_date,
dept_manager.to_date,
departments.dept_no,
departments.dept_name,
employees.emp_no,
employees.first_name,
employees.last_name
FROM dept_manager
JOIN departments ON
dept_manager.dept_no = departments.dept_no
JOIN employees ON
dept_manager.emp_no = employees.emp_no;

