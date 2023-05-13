USE soft_uni;

SELECT 
    COUNT(e.employee_id) AS ''
FROM
    employees AS e
WHERE
    e.manager_id IS NULL;