USE `soft_uni`;

SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    INSTR(`job_title`, 'engineer') = 0
ORDER BY `employee_id`;