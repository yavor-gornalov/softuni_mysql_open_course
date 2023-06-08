USE colonial_journey_management_system_db;

DELIMITER $$

CREATE PROCEDURE udp_modify_spaceship_light_speed_rate(spaceship_name VARCHAR(50), light_speed_rate_increse INT(11)) 
BEGIN
	START TRANSACTION; 
		IF ((SELECT count(*) FROM spaceships as s WHERE s.name = spaceship_name) <> 1) THEN 
			ROLLBACK;
        ELSE 
			UPDATE spaceships AS s
				SET s.light_speed_rate = s.light_speed_rate + light_speed_rate_increse 
			WHERE s.name = spaceship_name;
		END IF;
	COMMIT;
END$$

DELIMITER ;

CALL udp_modify_spaceship_light_speed_rate ('Na Pesho koraba', 1914);
SELECT name, light_speed_rate FROM spaceships WHERE name = 'Na Pesho koraba';

CALL udp_modify_spaceship_light_speed_rate ('USS Templar', 5);
SELECT name, light_speed_rate FROM spaceships WHERE name = 'USS Templar';