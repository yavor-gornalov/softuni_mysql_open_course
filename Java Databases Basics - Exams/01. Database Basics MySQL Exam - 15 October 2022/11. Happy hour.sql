USE restaurant_db;

DELIMITER $$

CREATE PROCEDURE udp_happy_hour(type VARCHAR(50))
BEGIN
	UPDATE products AS p 
	SET 
		p.price = p.price * 0.8
	WHERE
		p.price >= 10 and p.type = type;
END$$

DELIMITER ;

CALL udp_happy_hour ('Cognac');