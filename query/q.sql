select
  e.first_name,
  e.last_name
from
  employees e
where
  exists (
    select
      *
    from
      dept_manager a
    where
      a.dept_no = 'd001'
      and a.emp_no = e.emp_no);
