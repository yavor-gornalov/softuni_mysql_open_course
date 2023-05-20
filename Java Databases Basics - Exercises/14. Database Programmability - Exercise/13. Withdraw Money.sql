USE soft_uni;

DELIMITER $$

CREATE PROCEDURE usp_withdraw_money(account_id INT(11), money_amount DECIMAL(19,4))
BEGIN
	START TRANSACTION;
		IF money_amount <= 0 OR (SELECT balance FROM accounts WHERE id = account_id) - money_amount < 0 THEN 
			ROLLBACK;
		ELSE
			UPDATE accounts AS a
				SET a.balance = a.balance - money_amount
			WHERE a.id = account_id;
		END IF;
	COMMIT;
END$$

DELIMITER ;

SELECT * FROM accounts WHERE id = 1;
CALL usp_withdraw_money(1, 100);