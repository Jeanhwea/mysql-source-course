-- explain

select
  *
from
  employees e
where
  e.emp_no in (
    select
      a.emp_no
    from
      dept_manager a
    where
      date_sub(a.from_date, interval 30 day) < e.hire_date);
