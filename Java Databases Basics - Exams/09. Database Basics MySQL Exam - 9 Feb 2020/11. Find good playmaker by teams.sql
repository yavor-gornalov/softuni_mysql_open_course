USE fsd;

DELIMITER $$

CREATE PROCEDURE udp_find_playmaker(min_dribble_points INT, team_name VARCHAR(45))
BEGIN
SELECT 
    CONCAT_WS(' ', p.first_name, p.last_name) AS full_name,
    p.age,
    p.salary,
    sk.dribbling,
    sk.speed,
    t.name AS team_name
FROM
    skills_data AS sk
        JOIN
    players AS p ON sk.id = p.skills_data_id
        JOIN
    teams AS t ON p.team_id = t.id
WHERE
    t.name = team_name AND sk.dribbling > min_dribble_points
        AND sk.speed > (SELECT 
            AVG(sd.speed)
        FROM
            skills_data AS sd)
ORDER BY sk.speed DESC
LIMIT 1;
END$$

DELIMITER ;

CALL udp_find_playmaker (20, "Skyble");