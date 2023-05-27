USE stc;

SELECT 
    a.name,
    IF(HOUR(s.start) BETWEEN 6 AND 20,
        'Day',
        'Night') AS day_time,
    s.bill,
    cl.full_name,
    c.make,
    c.model,
    cat.name
FROM
    addresses AS a
        JOIN
    courses AS s ON a.id = s.from_address_id
        JOIN
    clients AS cl ON s.client_id = cl.id
        JOIN
    cars AS c ON s.car_id = c.id
        JOIN
    categories AS cat ON c.category_id = cat.id
ORDER BY s.id;
