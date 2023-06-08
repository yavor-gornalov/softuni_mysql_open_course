USE colonial_journey_management_system_db;

SELECT 
    j.id,
    p.name AS planet_name,
    s.name AS spaceport_name,
    j.purpose AS journey_purpose
FROM
    journeys AS j
        JOIN
    spaceports AS s ON j.destination_spaceport_id = s.id
        JOIN
    planets AS p ON s.planet_id = p.id
WHERE
    DATEDIFF(j.journey_end, j.journey_start) = (
		SELECT 
            DATEDIFF(j1.journey_end, j1.journey_start) AS journey_time
        FROM
            journeys AS j1
        ORDER BY journey_time
        LIMIT 1);
