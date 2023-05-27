USE stc;

SELECT 
    cl.full_name,
    COUNT(*) AS count_of_cars,
    SUM(s.bill) AS total_sum
FROM
    clients AS cl
        JOIN
    courses AS s ON cl.id = s.client_id
        JOIN
    cars AS c ON s.car_id = c.id
WHERE
    SUBSTR(cl.full_name FROM 2 FOR 1) = 'a'
GROUP BY cl.id
HAVING count_of_cars > 1
ORDER BY full_name;