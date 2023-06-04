USE ruk_database;

-- working on judge 
SELECT 
    ec.employee_id
FROM
    employees_clients AS ec
GROUP BY ec.employee_id
ORDER BY COUNT(*) , ec.employee_id
LIMIT 1;

UPDATE employees_clients 
SET 
    employee_id = 10
WHERE
    employee_id = client_id;
-- ----------------

UPDATE employees_clients 
SET 
    employee_id = (SELECT 
            ec.employee_id
        FROM
            employees_clients AS ec
        GROUP BY ec.employee_id
        ORDER BY COUNT(*) , ec.employee_id
        LIMIT 1)
WHERE
    employee_id = client_id;

SET @lowest_clients_count_id = (SELECT 
            ec.employee_id
        FROM
            employees_clients AS ec
        GROUP BY ec.employee_id
        ORDER BY COUNT(*) , ec.employee_id
        LIMIT 1);
SELECT @lowest_clients_count_id;

UPDATE employees_clients 
SET 
    employee_id = @lowest_clients_count_id
WHERE
    employee_id = client_id;
