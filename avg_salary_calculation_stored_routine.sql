CREATE DEFINER=`root`@`localhost` PROCEDURE `filter_salary`(in p_min_salary float, p_max_salary float)
BEGIN
select e.gender, d.dept_name, avg(s.salary) as avg_salary
from t_salaries s
join t_employees e on e.emp_no = s.emp_no
join t_dept_emp de on de.emp_no = e.emp_no
join t_departments d on d.dept_no = de.dept_no
where s.salary between p_min_salary and p_max_salary
group by d.dept_no, e.gender;
END