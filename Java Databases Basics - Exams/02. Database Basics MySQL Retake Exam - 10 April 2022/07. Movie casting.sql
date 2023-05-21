USE softuni_imdb;

SELECT 
    CONCAT_WS(' ', a.first_name, a.last_name) AS full_name,
    CONCAT(REVERSE(a.last_name),
            CHAR_LENGTH(a.last_name),
            '@cast.com') AS email,
	
    2022 - year(a.birthdate) AS age,
    a.height AS height
FROM
    actors AS a
        LEFT JOIN
    movies_actors AS ma ON a.id = ma.actor_id
WHERE
    ma.actor_id IS NULL
ORDER BY a.height;