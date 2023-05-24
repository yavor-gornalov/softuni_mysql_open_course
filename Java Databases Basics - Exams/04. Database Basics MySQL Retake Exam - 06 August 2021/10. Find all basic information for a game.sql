USE sgd;

DELIMITER $$

CREATE FUNCTION udf_game_info_by_name (game_name VARCHAR (20))
RETURNS TEXT
DETERMINISTIC
BEGIN
	RETURN (
		SELECT 
			concat("The ",g.name," is developed by a ",t.name," in an office with an address ",a.name)
		FROM
			games AS g
				JOIN
			teams AS t on g.team_id = t.id JOIN offices as o on t.office_id = o.id JOIN addresses as a on o.address_id = a.id
		WHERE
			g.name = game_name);
END$$

DELIMITER ;

SELECT udf_game_info_by_name('Bitwolf') AS info;
