USE soft_uni;

DELIMITER $$

CREATE PROCEDURE usp_get_holders_with_balance_higher_than(lower_limit DECIMAL(19,4))
BEGIN
	SELECT 
		h.first_name, h.last_name
	FROM
		account_holders AS h
			JOIN
		accounts AS a ON a.account_holder_id = h.id
	GROUP BY a.account_holder_id
	HAVING SUM(a.balance) > lower_limit
	ORDER BY a.account_holder_id;
END$$

DELIMITER ;

CALL usp_get_holders_with_balance_higher_than(7000);