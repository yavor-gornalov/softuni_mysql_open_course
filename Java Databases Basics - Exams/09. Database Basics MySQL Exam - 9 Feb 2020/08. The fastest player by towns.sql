USE fsd;

SELECT 
    MAX(sd.speed) AS max_speed, tn.name AS town_name
FROM
    towns AS tn
        LEFT JOIN
    stadiums AS s ON tn.id = s.town_id
        LEFT JOIN
    teams AS t ON s.id = t.stadium_id
        LEFT JOIN
    players AS p ON t.id = p.team_id
        LEFT JOIN
    skills_data AS sd ON p.skills_data_id = sd.id
WHERE
    t.name != 'Devify'
GROUP BY tn.name
ORDER BY max_speed DESC , tn.name;

