USE online_store;

SELECT 
    *
FROM
    reviews AS r
WHERE
    LEFT(r.content, 2) = 'My'
        AND CHAR_LENGTH(r.content) > 61
ORDER BY r.rating DESC;