select
  e.first_name, e.last_name
from
  employees e
where
  e.emp_no in (
    select
      a.emp_no
    from
       dept_manager a
    where
      a.dept_no = 'd001');
