USE colonial_journey_management_system_db;

SELECT 
    c.id, CONCAT(c.first_name, ' ', c.last_name) AS full_name
FROM
    colonists AS c
        JOIN
    travel_cards AS tc ON c.id = tc.colonist_id
WHERE
    job_during_journey = 'Pilot'
ORDER BY c.id;