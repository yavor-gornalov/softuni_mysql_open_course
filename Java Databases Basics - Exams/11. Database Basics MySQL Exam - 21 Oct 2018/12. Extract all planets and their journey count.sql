USE colonial_journey_management_system_db;

SELECT 
    p.name, COUNT(j.id) AS journeys_count
FROM
    journeys AS j
        JOIN
    spaceports AS s ON j.destination_spaceport_id = s.id
        JOIN
    planets AS p ON s.planet_id = p.id
GROUP BY p.name
ORDER BY journeys_count DESC , p.name ASC;