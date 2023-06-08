USE colonial_journey_management_system_db;

SELECT 
    tmp.job_during_journey AS job_name
FROM
    (SELECT 
        tc.job_during_journey, COUNT(*) AS count
    FROM
        journeys AS j
    JOIN travel_cards AS tc ON j.id = tc.journey_id
    WHERE
        DATEDIFF(j.journey_end, j.journey_start) = (SELECT 
                DATEDIFF(j1.journey_end, j1.journey_start) AS journey_time
            FROM
                journeys AS j1
            ORDER BY journey_time DESC
            LIMIT 1)
    GROUP BY tc.job_during_journey
    ORDER BY count
    LIMIT 1) AS tmp;
