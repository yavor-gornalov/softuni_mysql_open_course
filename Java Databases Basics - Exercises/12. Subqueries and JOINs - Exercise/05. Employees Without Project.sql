USE soft_uni;

SELECT 
    e.employee_id, e.first_name
FROM
    employees AS e
        LEFT JOIN
    employees_projects AS ep ON e.employee_id = ep.employee_id
ORDER BY e.employee_id DESC
LIMIT 3;