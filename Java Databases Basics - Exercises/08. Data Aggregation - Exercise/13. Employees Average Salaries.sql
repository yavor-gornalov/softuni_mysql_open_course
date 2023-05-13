USE soft_uni;

CREATE TABLE high_paid_employees AS SELECT * FROM
    employees AS e
WHERE
    e.salary > 30000;

DELETE FROM high_paid_employees as h where h.manager_id = 42;

UPDATE high_paid_employees as h
SET h.salary = h.salary + 5000
WHERE h.department_id = 1;

SELECT 
	h.department_id,
    avg(h.salary) as avg_salary
FROM high_paid_employees as h 
GROUP BY h.department_id
ORDER BY h.department_id;