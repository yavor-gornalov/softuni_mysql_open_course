USE restaurant_db;

DELIMITER $$

CREATE FUNCTION udf_client_bill(full_name VARCHAR(50))
RETURNS DECIMAL(19,2)
DETERMINISTIC
BEGIN
	RETURN (
		SELECT 
			SUM(p.price) AS bill
		FROM
			clients AS c
				JOIN
			orders_clients AS oc ON c.id = oc.client_id
				JOIN
			orders AS o ON o.id = oc.order_id
				JOIN
			orders_products AS op ON o.id = op.order_id
				JOIN
			products AS p ON op.product_id = p.id
		WHERE
			CONCAT_WS(' ', c.first_name, c.last_name) = full_name
		GROUP BY c.id
    );
END$$

DELIMITER ;

SELECT 
    c.first_name,
    c.last_name,
    UDF_CLIENT_BILL('Silvio Blyth') AS 'bill'
FROM
    clients c
WHERE
    c.first_name = 'Silvio'
        AND c.last_name = 'Blyth';
