use employees;

set optimizer_trace="enabled=on";

select
  e.first_name, e.last_name, a.from_date
from
  dept_manager a
  join departments d on a.dept_no = d.dept_no
  join employees e on a.emp_no = e.emp_no
where
  d.dept_no = 'd001';

select trace from information_schema.optimizer_trace\G
