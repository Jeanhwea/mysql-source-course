select
  /*+ rtc */
  d.dept_no,
  e.first_name,
  e.last_name,
  s.from_date,
  s.to_date,
  s.salary
from
  dept_manager a,
  departments d,
  employees e,
  salaries s
where
  a.dept_no = d.dept_no
  and a.emp_no = e.emp_no
  and a.emp_no = s.emp_no
  and d.dept_no = 'd001';
