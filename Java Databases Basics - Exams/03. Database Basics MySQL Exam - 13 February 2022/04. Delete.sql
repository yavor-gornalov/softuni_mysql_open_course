USE online_store;

DELETE c FROM customers AS c
        LEFT JOIN
    orders AS o ON c.id = o.customer_id 
WHERE
    o.customer_id IS NULL;