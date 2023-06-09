USE colonial_journey_management_system_db;

UPDATE journeys AS j 
SET 
    j.purpose = (CASE
        WHEN j.id % 2 = 0 THEN 'Medical'
        WHEN j.id % 3 = 0 THEN 'Technical'
        WHEN j.id % 5 = 0 THEN 'Educational'
        WHEN j.id % 7 = 0 THEN 'Military'
        ELSE j.purpose
    END);