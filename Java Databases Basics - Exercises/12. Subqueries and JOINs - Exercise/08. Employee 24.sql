USE soft_uni;

SELECT 
    e.employee_id,
    e.first_name,
    IF(YEAR(p.start_date) > 2004,
        NULL,
        p.name) AS 'project_name'
FROM
    employees AS e
        JOIN
    employees_projects AS ep USING (employee_id)
        JOIN
    projects AS p USING (project_id)
WHERE
    e.employee_id = 24
ORDER BY p.name;