USE fsd;

INSERT INTO coaches (first_name, last_name, salary, coach_level)
SELECT 
    p.first_name AS first_name,
    p.last_name AS last_name,
    2 * p.salary AS salary,
    CHAR_LENGTH(p.first_name) AS coach_level
FROM
    players AS p
WHERE
    p.age >= 45;