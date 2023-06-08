USE colonial_journey_management_system_db;

SELECT 
    s.name AS spaceship_name, p.name AS spaceport_name
FROM
    spaceships AS s
        JOIN
    journeys AS j ON s.id = j.spaceship_id
        JOIN
    spaceports AS p ON j.destination_spaceport_id = p.id
ORDER BY s.light_speed_rate DESC
LIMIT 1;