USE soft_uni;

DELIMITER $$

CREATE FUNCTION ufn_get_salary_level(current_salary	DECIMAL(19,4))
RETURNS VARCHAR (10)
DETERMINISTIC
BEGIN
	DECLARE salary_rate VARCHAR(10);
	IF current_salary < 30000 THEN SET salary_rate = "Low";
    ELSEIF current_salary <= 50000 THEN SET salary_rate = "Average";
    ELSE SET salary_rate = "High";
    END IF;
    RETURN salary_rate;
END$$

DELIMITER ;

SELECT ufn_get_salary_level(125500.00);