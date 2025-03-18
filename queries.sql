-- Query 1: List employee number, last name, first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

-- Query 2: List first name, last name, and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- Query 3: List department managers with their department number, department name, employee number, last name, and first name
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN employees e ON dm.emp_no = e.emp_no
JOIN departments d ON dm.dept_no = d.dept_no;

-- Query 4: List department number for each employee along with employee number, last name, first name, and department name
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

-- Query 5: List first name, last name, and sex of employees named 'Hercules' whose last name starts with 'B'
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Query 6: List each employee in the Sales department (employee number, last name, first name)
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- Query 7: List each employee in the Sales and Development departments (employee number, last name, first name, department name)
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- Query 8: List the frequency counts of all employee last names in descending order
SELECT last_name, COUNT(*) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;
