select
  x.dept_no,
  e.first_name,
  e.last_name
from
  dept_manager x
  left join employees e using (emp_no)
where
  dept_no < 'd004';
