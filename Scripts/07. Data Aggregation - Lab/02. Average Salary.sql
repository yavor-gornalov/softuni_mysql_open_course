USE `restaurant`;

SELECT 
    e.`department_id`, ROUND(AVG(e.`salary`), 2)
FROM
    `employees` AS e
GROUP BY `department_id`; 