USE softuni_imdb;

INSERT INTO actors (first_name, last_name, birthdate, height, awards, country_id)  
SELECT
      REVERSE(a.first_name) AS first_name,
      REVERSE(a.last_name) AS last_name,
      DATE_SUB(a.birthdate, INTERVAL 2 DAY) AS birthdate,
      a.height + 10 AS height,
      a.country_id AS awards,
      3 AS country_id 
FROM
     actors AS a 
WHERE
     a.id <= 10
