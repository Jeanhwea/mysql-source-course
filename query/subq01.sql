select
  count(distinct emp_no) as emp_cnt
from
  dept_emp a
where
  a.emp_no < 10100
  and a.dept_no = (
    select
      d.dept_no
    from
      departments d
    where
      d.dept_name = 'Development');
