USE sss_db;

SELECT 
    REVERSE(s.name) AS reversed_name,
    CONCAT_WS('-', UPPER(t.name), a.name) AS full_address,
    COUNT(*) AS employees_count
FROM
    stores AS s
        JOIN
    addresses AS a ON s.address_id = a.id
        JOIN
    towns AS t ON a.town_id = t.id
        JOIN
    employees AS e ON s.id = e.store_id
GROUP BY s.id
ORDER BY full_address ASC; 