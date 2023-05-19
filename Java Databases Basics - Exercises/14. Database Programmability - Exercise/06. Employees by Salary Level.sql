USE soft_uni;

DELIMITER $$

CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level	VARCHAR(10))

BEGIN
	SELECT 
    e.first_name, e.last_name
FROM
    employees AS e
WHERE
    UFN_GET_SALARY_LEVEL(e.salary) = salary_level
ORDER BY e.first_name DESC , e.last_name DESC;
END$$

DELIMITER ;

CALL usp_get_employees_by_salary_level("High");