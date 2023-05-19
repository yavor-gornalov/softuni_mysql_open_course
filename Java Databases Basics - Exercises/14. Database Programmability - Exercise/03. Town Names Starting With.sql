USE soft_uni;

DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with(starting_string VARCHAR(50))
BEGIN
	SELECT 
		t.name AS town_name
	FROM
		towns AS t
	WHERE LOWER( LEFT(t.name,CHARACTER_LENGTH(starting_string))) = LOWER(starting_string)
	ORDER BY town_name;
END$$
DELIMITER ;

CALL usp_get_towns_starting_with("BEL");