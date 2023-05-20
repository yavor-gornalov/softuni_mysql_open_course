USE soft_uni;

DELIMITER $$

CREATE PROCEDURE usp_transfer_money(from_account_id INT(11), to_account_id INT(11), money_amount DECIMAL(19,4))
BEGIN
	START TRANSACTION;
		IF money_amount <= 0 THEN ROLLBACK;  
        ELSEIF (SELECT id FROM accounts WHERE id = from_account_id) IS NULL THEN 
			ROLLBACK;
        ELSEIF (SELECT id FROM accounts WHERE id = to_account_id) IS NULL THEN 
			ROLLBACK;
        ELSEIF (SELECT balance FROM accounts WHERE id = from_account_id) < money_amount THEN 
			ROLLBACK;
        ELSEIF (SELECT id FROM accounts WHERE id = from_account_id) = (SELECT id FROM accounts WHERE id = to_account_id) THEN 
			ROLLBACK;
		ELSE
			UPDATE accounts AS a
				SET a.balance = a.balance - money_amount
			WHERE a.id = from_account_id;
			UPDATE accounts AS a
				SET a.balance = a.balance + money_amount
			WHERE a.id = to_account_id;
		END IF;
	COMMIT;
END$$

DELIMITER ;

SELECT * FROM accounts WHERE id IN(1,2);
CALL usp_transfer_money(1, 2, 50);