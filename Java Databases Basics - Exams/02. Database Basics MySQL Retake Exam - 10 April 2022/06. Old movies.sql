USE softuni_imdb;

SELECT 
    m.id, m.title, mai.runtime, mai.budget, mai.release_date
FROM
    movies AS m
        JOIN
    movies_additional_info AS mai ON m.movie_info_id = mai.id
WHERE
    YEAR(mai.release_date) BETWEEN 1996 AND 1999
ORDER BY mai.runtime , m.id
LIMIT 20;