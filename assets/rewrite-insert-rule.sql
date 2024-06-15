-- 插入规则
INSERT INTO query_rewrite.rewrite_rules
            (pattern_database, pattern, replacement)
VALUES (
  "employees",
  "SELECT * FROM employees WHERE emp_no > ? ",
  "SELECT * FROM employees WHERE emp_no > ? LIMIT 1"
);
-- 应用规则
CALL query_rewrite.flush_rewrite_rules();
