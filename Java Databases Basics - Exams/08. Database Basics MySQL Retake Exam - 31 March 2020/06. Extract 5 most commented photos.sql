USE instd;

SELECT 
    p.id,
    p.date AS date_and_time,
    p.description,
    COUNT(*) AS commentsCount
FROM
    photos AS p
        JOIN
    comments AS s ON p.id = s.photo_id
GROUP BY p.id
ORDER BY commentsCount DESC , p.id ASC
LIMIT 5;