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
      emp_no <= 10100) emp_100
where
  t.emp_no = emp_100.emp_no
  and t.from_date > '2000-01-01';
