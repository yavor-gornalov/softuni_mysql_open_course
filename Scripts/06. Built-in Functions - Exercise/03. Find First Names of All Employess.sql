USE `soft_uni`;

SELECT 
    `first_name`
FROM
    `employees`
WHERE
    `department_id` IN (3 , 10)
        AND `hire_date` BETWEEN DATE("1995-1-1") AND DATE("2005-12-31")
ORDER BY `employee_id`;