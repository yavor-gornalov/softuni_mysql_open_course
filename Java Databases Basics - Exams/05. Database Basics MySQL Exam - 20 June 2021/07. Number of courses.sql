USE stc;

SELECT 
    c.id,
    c.make,
    c.mileage,
    COUNT(s.bill) AS count_of_courses,
    ROUND(AVG(s.bill), 2) AS avg_bill
FROM
    cars AS c
        LEFT JOIN
    courses AS s ON c.id = s.car_id
GROUP BY c.id
HAVING count_of_courses != 2
ORDER BY count_of_courses DESC , c.id ASC;