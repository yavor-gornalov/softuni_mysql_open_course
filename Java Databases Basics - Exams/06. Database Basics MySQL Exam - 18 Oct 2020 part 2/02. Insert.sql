USE sss_db;

INSERT INTO products_stores
SELECT 
    p.id as product_id,
    1 as store_id
FROM
    products AS p
        LEFT JOIN
    products_stores AS ps ON p.id = ps.product_id
WHERE
    ps.store_id IS NULL;