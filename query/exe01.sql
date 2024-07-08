select
  emp_no,
  first_name,
  birth_date,
  ceil(datediff(current_date, birth_date) / 365) as age
from
  employees
where
  emp_no < 10010;
