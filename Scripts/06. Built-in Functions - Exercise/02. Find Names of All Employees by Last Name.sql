USE `soft_uni`;

SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    LOWER(INSTR(`last_name`, 'ei')) > 0
ORDER BY `employee_id`;