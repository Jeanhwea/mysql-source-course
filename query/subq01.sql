select
  count(*)
from
  dept_emp a
where
  a.dept_no = (
    select
      d.dept_no
    from
      departments d
    where
      d.dept_name = 'Development');
