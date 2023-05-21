USE softuni_imdb;

DELIMITER $$

CREATE function udf_actor_history_movies_count(full_name VARCHAR(50))
returns int
deterministic

BEGIN
RETURN (
	SELECT 
		COUNT(*) AS history_movies
	FROM
		actors AS a
			JOIN
		movies_actors AS ma ON a.id = ma.actor_id
			JOIN
		movies AS m ON ma.movie_id = m.id
			JOIN
		genres_movies AS gm ON m.id = gm.movie_id
			JOIN
		genres AS g ON gm.genre_id = g.id
	WHERE
		g.name = 'History'
			AND CONCAT_WS(' ', first_name, last_name) = full_name
	GROUP BY a.id);
END$$

DELIMITER ;

SELECT UDF_ACTOR_HISTORY_MOVIES_COUNT('Stephan Lundberg') AS 'history_movies';