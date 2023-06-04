USE ruk_database;

SELECT 
    CONCAT_WS(' ', e.first_name, e.last_name) AS name,
    e.started_on,
    COUNT(*) AS count_of_clients
FROM
    employees AS e
        JOIN
    employees_clients AS ec ON e.id = ec.employee_id
GROUP BY e.id
ORDER BY count_of_clients DESC , e.id;