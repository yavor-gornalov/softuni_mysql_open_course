USE `soft_uni`;

SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    LOWER(SUBSTR(`first_name` FROM 1 FOR 2)) = 'sa'
ORDER BY `employee_id`;
