USE gringotts;

SELECT 
    wd.deposit_group
FROM
    wizzard_deposits AS wd
GROUP BY wd.deposit_group
ORDER BY AVG(wd.magic_wand_size)
LIMIT 1;
