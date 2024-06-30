select distinct
  first_name
from
  employees a
  left join dept_emp x on a.emp_no = x.emp_no
where
  x.dept_no = 'd001'
  and (
    select
      count(*)
    from
      employees b
    left join dept_emp d on b.emp_no = d.emp_no
  where
    d.dept_no = 'd001'
    and b.first_name = a.first_name) > 20;


-- select
--   first_name,
--   count(*) cnt
-- from
--   employees a,
--   dept_emp x
-- where
--   a.emp_no = x.emp_no
--   and x.dept_no = 'd001'
-- group by
--   first_name
-- having
--   count(*) > 1;
