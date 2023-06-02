USE instd;

SELECT 
    concat(left(p.description, 30), "...") as summary,
    p.date
FROM
    photos AS p
WHERE
    DAY(p.date) = 10 ORDER BY p.date desc;