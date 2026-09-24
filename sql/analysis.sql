-- 1. Employees by department
SELECT d.department, COUNT(*) AS employee_count
FROM employees e JOIN departments d ON e.department_id=d.department_id
GROUP BY d.department ORDER BY employee_count DESC;

-- 2. Average salary by department
SELECT d.department, ROUND(AVG(e.salary),2) AS average_salary
FROM employees e JOIN departments d ON e.department_id=d.department_id
GROUP BY d.department ORDER BY average_salary DESC;

-- 3. Departments above the overall average
SELECT d.department, ROUND(AVG(e.salary),2) AS average_salary
FROM employees e JOIN departments d ON e.department_id=d.department_id
GROUP BY d.department
HAVING AVG(e.salary) > (SELECT AVG(salary) FROM employees);

-- 4. Highest-paid employees
SELECT employee_id, job_role, salary
FROM employees ORDER BY salary DESC LIMIT 5;

-- 5. Experience above five years
SELECT employee_id, job_role, years_experience, salary
FROM employees WHERE years_experience > 5
ORDER BY years_experience DESC;

-- 6. Average salary by job role
SELECT job_role, ROUND(AVG(salary),2) AS average_salary
FROM employees GROUP BY job_role ORDER BY average_salary DESC;

-- 7. Department salary range
SELECT d.department, MIN(e.salary) AS min_salary,
       MAX(e.salary) AS max_salary,
       MAX(e.salary)-MIN(e.salary) AS salary_range
FROM employees e JOIN departments d ON e.department_id=d.department_id
GROUP BY d.department ORDER BY salary_range DESC;

-- 8. Employee count by role
SELECT job_role, COUNT(*) AS employee_count
FROM employees GROUP BY job_role ORDER BY employee_count DESC;

-- 9. Salaries above 2500
SELECT employee_id, job_role, salary
FROM employees WHERE salary > 2500 ORDER BY salary DESC;

-- 10. Average salary by experience band
SELECT CASE
       WHEN years_experience <= 2 THEN '0-2 years'
       WHEN years_experience <= 5 THEN '3-5 years'
       ELSE '6+ years' END AS experience_band,
       ROUND(AVG(salary),2) AS average_salary
FROM employees
GROUP BY experience_band
ORDER BY average_salary;
