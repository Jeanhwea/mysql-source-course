select
  *
from
  titles t,
  (
    select
      *
    from
      employees
    where
      emp_no <= 10100) as emp_100
where
  t.emp_no = emp_100.emp_no
  and emp_100.hire_date < '1986-01-01';
