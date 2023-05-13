USE `restaurant`;

SELECT 
    COUNT(e.`id`)
FROM
    `products` AS e
WHERE
    e.`category_id` = 2 AND e.`price` > 8;