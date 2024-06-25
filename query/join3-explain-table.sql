use employees;

explain

select
  e.first_name, e.last_name, a.from_date, a.to_date
from
  dept_manager a join departments d join employees e
where
  a.dept_no = d.dept_no and a.emp_no = e.emp_no and d.dept_no = 'd001';

-- show warnings\G
