USE colonial_journey_management_system_db;

SELECT 
    p.name AS planet_name, s.name AS spaceport_name
FROM
    journeys AS j
        JOIN
    spaceports AS s ON j.destination_spaceport_id = s.id
        JOIN
    planets AS p ON s.planet_id = p.id
WHERE
    j.purpose = 'Educational'
ORDER BY s.name DESC;