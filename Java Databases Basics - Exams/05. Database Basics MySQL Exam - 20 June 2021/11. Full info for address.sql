USE stc;

DELIMITER $$

CREATE PROCEDURE udp_courses_by_address(address_name VARCHAR(100))
BEGIN
	SELECT 
		a.name,
		cl.full_name as full_names,
		CASE
			WHEN s.bill <= 20 THEN 'Low'
			WHEN s.bill <= 30 THEN 'Medium'
			ELSE 'High'
		END AS level_of_bill,
		c.make,
		c.condition,
		cat.name
	FROM
		addresses AS a
			JOIN
		courses AS s ON a.id = s.from_address_id
			JOIN
		clients AS cl ON s.client_id = cl.id
			JOIN
		cars AS c ON s.car_id = c.id join categories as cat on c.category_id = cat.id 
	WHERE
		a.name = address_name ORDER BY c.make, full_names;
END$$

DELIMITER ;

CALL udp_courses_by_address('700 Monterey Avenue');

