USE colonial_journey_management_system_db;

SELECT 
    tc.card_number, tc.job_during_journey
FROM
    travel_cards AS tc
ORDER BY tc.card_number;