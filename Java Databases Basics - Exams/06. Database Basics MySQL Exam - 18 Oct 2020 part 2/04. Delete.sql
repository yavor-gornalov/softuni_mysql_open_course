USE sss_db;

DELETE e FROM employees AS e 
WHERE
    e.salary >= 6000
    AND e.manager_id IS NOT NULL;
