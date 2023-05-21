USE restaurant_db;

SELECT 
    t.id AS table_id,
    t.capacity AS capacity,
    COUNT(*) AS count_clients,
    (CASE
        WHEN COUNT(*) < t.capacity THEN 'Free seats'
        WHEN COUNT(*) = t.capacity THEN 'Full'
        ELSE 'Extra seats'
    END) AS availability
FROM
    tables AS t
        LEFT JOIN
    orders AS o ON t.id = o.table_id
        JOIN
    orders_clients AS oc ON o.id = oc.order_id
        JOIN
    clients AS c ON oc.client_id = c.id
WHERE
    t.floor = 1
GROUP BY t.id
ORDER BY t.id DESC;
