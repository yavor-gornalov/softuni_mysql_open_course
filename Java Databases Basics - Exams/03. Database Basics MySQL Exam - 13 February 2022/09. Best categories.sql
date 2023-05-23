USE online_store;

SELECT 
    COUNT(*) AS items_count,
    c.name AS name,
    ROUND(SUM(p.quantity_in_stock)) AS total_quantity
FROM
    categories AS c
        LEFT JOIN
    products AS p ON c.id = p.category_id
GROUP BY c.name
ORDER BY items_count DESC, total_quantity LIMIT 5; 