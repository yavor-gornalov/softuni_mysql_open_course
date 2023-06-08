USE colonial_journey_management_system_db;

DELIMITER $$

CREATE FUNCTION udf_count_colonists_by_destination_planet (planet_name VARCHAR (30))
RETURNS INT
DETERMINISTIC

BEGIN
RETURN (
	SELECT 
		COUNT(tc.colonist_id) AS count
	FROM
		planets AS p
			LEFT JOIN
		spaceports AS s ON s.planet_id = p.id
			LEFT JOIN
		journeys AS j ON j.destination_spaceport_id = s.id
			LEFT JOIN
		travel_cards AS tc ON j.id = tc.journey_id
	WHERE
		p.name = planet_name
	GROUP BY p.name );
END$$

DELIMITER ;

SELECT 
    p.name,
    UDF_COUNT_COLONISTS_BY_DESTINATION_PLANET('Otroyphus') AS count
FROM
    planets AS p
WHERE
    p.name = 'Otroyphus';