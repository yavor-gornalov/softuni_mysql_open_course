USE colonial_journey_management_system_db;

DELETE c FROM colonists AS c
        LEFT JOIN
    travel_cards AS tc ON c.id = tc.colonist_id 
WHERE
    tc.journey_id IS NULL;