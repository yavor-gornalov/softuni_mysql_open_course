USE `soft_uni`;

SELECT 
    `town_id`, `name`
FROM
    `towns`
WHERE
    `name` NOT REGEXP ('^[rbd]')
ORDER BY `name`;