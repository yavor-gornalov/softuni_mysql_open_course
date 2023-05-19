USE soft_uni;

DELIMITER $$

CREATE PROCEDURE usp_get_employees_from_town(town_name	varchar(50))
BEGIN
	SELECT 
		e.first_name, e.last_name
	FROM
		employees AS e
			JOIN
		addresses AS a USING (address_id)
			JOIN
		towns AS t USING (town_id)
	WHERE
		t.name = town_name
	ORDER BY e.first_name , e.last_name , e.employee_id;
END$$

DELIMITER ;

CALL usp_get_employees_from_town('Sofia')