USE stc;

DELIMITER $$

CREATE FUNCTION udf_courses_by_client (phone_num VARCHAR (20))
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN (SELECT 
				count(*)
			FROM
				courses AS s
					JOIN
				clients AS c ON s.client_id = c.id
			WHERE
				c.phone_number = phone_num);
END$$

DELIMITER ;

SELECT udf_courses_by_client ('(803) 6386812') as `count`; 
