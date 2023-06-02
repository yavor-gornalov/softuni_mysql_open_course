USE fsd;

DELIMITER $$

CREATE PROCEDURE udp_find_playmaker(min_dribble_points int, team_name varchar(45))
BEGIN
SELECT 
    CONCAT_WS(' ', p.first_name, p.last_name) AS full_name,
    p.age,
    p.salary,
    sk.dribbling,
    sk.speed,
    t.name AS team_name,
    AVG(sk.speed)
FROM
    skills_data AS sk
        JOIN
    players AS p ON sk.id = p.skills_data_id
        JOIN
    teams AS t ON p.team_id = t.id
WHERE
    t.name = team_name AND sk.dribbling > min_dribble_points
GROUP BY t.name
ORDER BY sk.speed DESC;
END$$

DELIMITER ;

CALL udp_find_playmaker (20, ‘Skyble’);