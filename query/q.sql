-- explain
-- select
--   *
-- from
--   employees e
-- where
--   e.emp_no in (
--     select
--       a.emp_no
--     from
--       dept_manager a
--     where
--       a.dept_no >= 'd003');

explain
select
  *
from
  employees e
where
  e.emp_no in (
    select
      /*+ SEMIJOIN(FIRSTMATCH) */
      a.emp_no
    from
      dept_manager a
    where
      a.from_date >= '1995-01-01');
