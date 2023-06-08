USE colonial_journey_management_system_db;

SELECT 
    s.name,
    s.manufacturer
FROM
    colonists AS c
        JOIN
    travel_cards AS tc ON c.id = tc.colonist_id
        JOIN
    journeys AS j ON tc.journey_id = j.id
        JOIN
    spaceships AS s ON j.spaceship_id = s.id
WHERE
    tc.job_during_journey = 'Pilot'
        AND c.birth_date > '1989-01-01' ORDER BY s.name;