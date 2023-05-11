USE `soft_uni`;

SELECT 
    `town_id`, `name`
FROM
    `towns`
WHERE
    `name` REGEXP ('^[mkbe]')
ORDER BY `name`;