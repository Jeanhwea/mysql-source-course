select distinct
  a.first_name
from employees a
where a.emp_no < 10200
  and (
    select count(*) from employees b
    where b.emp_no < 10200 and b.first_name = a.first_name) > 1;
