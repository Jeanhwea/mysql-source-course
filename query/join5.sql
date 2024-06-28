select /*+ rtc */
  d.dept_no, t.title, e.first_name, s.from_date, s.salary
from
  dept_manager a join departments d join employees e join salaries s join titles t
where
  a.dept_no = d.dept_no and a.emp_no = e.emp_no and a.emp_no = s.emp_no
  and a.emp_no = t.emp_no and d.dept_no = 'd001';
