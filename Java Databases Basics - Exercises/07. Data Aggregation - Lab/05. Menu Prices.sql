USE `restaurant`;

SELECT 
    e.`category_id`,
    ROUND(AVG(e.`price`), 2) AS `Average Price`,
    ROUND(MIN(e.`price`), 2) AS `Cheapest Product`,
    ROUND(MAX(e.`price`), 2) AS `Most Expensive Product`
FROM
    `products` AS e
GROUP BY e.`category_id`
