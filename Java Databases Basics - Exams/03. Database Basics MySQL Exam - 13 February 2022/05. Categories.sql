USE online_store;

SELECT 
    *
FROM
    categories AS c
GROUP BY c.name
ORDER BY c.name DESC;