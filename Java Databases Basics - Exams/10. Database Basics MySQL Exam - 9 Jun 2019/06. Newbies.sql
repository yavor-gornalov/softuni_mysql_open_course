USE ruk_database;

SELECT 
    e.id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    CONCAT('$', e.salary),
    e.started_on
FROM
    employees AS e
WHERE
    e.salary >= 100000
        AND YEAR(e.started_on) >= 2018
ORDER BY e.salary DESC , e.id