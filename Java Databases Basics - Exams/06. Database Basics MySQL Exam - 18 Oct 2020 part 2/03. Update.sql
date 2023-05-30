USE sss_db;

UPDATE employees AS e
        JOIN
    stores AS s ON e.store_id = s.id 
SET 
    e.manager_id = 3,
    e.salary = e.salary - 500
WHERE
    s.name NOT IN ('Cardguard' , 'Veribet')
        AND YEAR(e.hire_date) > 2003