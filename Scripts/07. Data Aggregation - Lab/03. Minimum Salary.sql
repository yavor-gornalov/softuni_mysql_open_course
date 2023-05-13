USE `restaurant`;

SELECT 
    e.`department_id`, MIN(e.`salary`) AS `Min Salary`
FROM
    `employees` AS e
GROUP BY e.`department_id`
HAVING `Min Salary` > 800;