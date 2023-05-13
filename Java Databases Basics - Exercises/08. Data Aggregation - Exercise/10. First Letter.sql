USE gringotts;

SELECT 
    SUBSTR(wd.first_name FROM 1 FOR 1) AS first_letter
FROM
    wizzard_deposits AS wd
WHERE
    wd.deposit_group = 'Troll Chest'
GROUP BY first_letter
ORDER BY first_letter;