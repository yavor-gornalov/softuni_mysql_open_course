USE `geography`;

SELECT 
    `peak_name`,
    `river_name`,
    LOWER(CONCAT(`peak_name`, SUBSTR(`river_name`, 2))) AS mix
FROM
    `peaks` AS p,
    `rivers` AS r
WHERE
    RIGHT(p.`peak_name`, 1) = LEFT(r.`river_name`, 1)
ORDER BY `mix`;