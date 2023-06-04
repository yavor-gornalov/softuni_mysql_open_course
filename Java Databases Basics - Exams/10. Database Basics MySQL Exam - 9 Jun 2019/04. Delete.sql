USE ruk_database;

DELETE e FROM employees AS e
        LEFT JOIN
    employees_clients AS ec ON e.id = ec.employee_id 
WHERE
    ec.client_id IS NULL