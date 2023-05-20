USE soft_uni;

DELIMITER $$

CREATE PROCEDURE usp_calculate_future_value_for_account(account_id INT(11), interest_rate DECIMAL(19,4))
BEGIN
	SELECT 
		a.id AS account_id,
		h.first_name,
		h.last_name,
		a.balance AS current_balance,
		UFN_CALCULATE_FUTURE_VALUE(a.balance, interest_rate, 5) AS balance_in_5_years
	FROM
		account_holders AS h
			JOIN
		accounts AS a ON a.account_holder_id = h.id
	WHERE
		a.id = account_id;
END$$

DELIMITER ;

CALL usp_calculate_future_value_for_account(1, 0.1);