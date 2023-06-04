USE ruk_database;

DELIMITER $$

CREATE FUNCTION udf_client_cards_count(name VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
RETURN (
	SELECT 
		count(c.id) as cards
	FROM
		clients AS cl
			JOIN
		bank_accounts AS ba ON cl.id = ba.client_id
			JOIN 
		cards AS c on ba.id = c.bank_account_id

	WHERE cl.full_name = name
	GROUP BY cl.id);
END$$

DELIMITER ;

SELECT c.full_name, udf_client_cards_count('Baxy David') as `cards` FROM clients c
WHERE c.full_name = 'Baxy David';

