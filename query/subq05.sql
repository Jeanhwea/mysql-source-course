select
  *
from
  departments d
where
  d.dept_no not in (
    select
      a.dept_no
    from
      dept_manager a
    where
      a.from_date > '1995-01-01');
