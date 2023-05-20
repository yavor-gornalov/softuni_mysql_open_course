USE soft_uni;

DELIMITER $$

CREATE PROCEDURE usp_deposit_money(account_id INT(11), money_amount DECIMAL(19,4))
BEGIN
	START TRANSACTION;
		IF money_amount <= 0 THEN 
			ROLLBACK;
		ELSE
			UPDATE accounts AS a
				SET a.balance = a.balance + money_amount
			WHERE a.id = account_id;
		END IF;
	COMMIT;
END$$

DELIMITER ;

SELECT * FROM accounts WHERE id = 1;
CALL usp_deposit_money(1, 100);