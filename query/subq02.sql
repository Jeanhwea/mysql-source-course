select
  count(x.emp_no) as emp_cnt
from
  dept_emp x
where
  x.dept_no in (
    select
      a.dept_no
    from
      dept_manager a
    where
      a.emp_no = 110022);
