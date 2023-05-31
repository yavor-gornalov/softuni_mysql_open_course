USE sss_db;

SELECT 
    p.name,
    p.price,
    p.best_before,
    CONCAT(SUBSTR(p.description FROM 1 FOR 10),
            '...') AS short_description,
    pc.url
FROM
    products AS p
        JOIN
    pictures AS pc ON p.picture_id = pc.id
WHERE
    CHAR_LENGTH(p.description) > 100
        AND YEAR(pc.added_on) < 2019
        AND p.price > 20
ORDER BY p.price DESC;