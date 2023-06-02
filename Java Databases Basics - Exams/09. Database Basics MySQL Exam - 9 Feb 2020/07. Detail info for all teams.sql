USE fsd;

SELECT 
    t.name AS team_name,
    t.established AS established,
    t.fan_base AS fan_base,
    COUNT(p.id) AS players_count
FROM
    teams AS t
        LEFT JOIN
    players AS p ON t.id = p.team_id
GROUP BY t.id
ORDER BY players_count DESC , fan_base DESC;