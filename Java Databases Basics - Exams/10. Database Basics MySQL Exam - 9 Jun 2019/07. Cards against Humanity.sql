USE ruk_database;

SELECT 
    c.id, CONCAT(c.card_number, ' : ', cl.full_name)
FROM
    cards AS c
        JOIN
    bank_accounts AS ba ON c.bank_account_id = ba.id
        JOIN
    clients AS cl ON ba.client_id = cl.id
ORDER BY c.id DESC
