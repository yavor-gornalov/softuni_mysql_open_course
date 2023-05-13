USE `soft_uni`;

CREATE VIEW v_employees_hired_after_2000 AS
    SELECT 
        `first_name`, `last_name`
    FROM
        `employees`
    WHERE
        `hire_date` > '2000-12-31';


SELECT 
    *
FROM
    `v_employees_hired_after_2000`;

