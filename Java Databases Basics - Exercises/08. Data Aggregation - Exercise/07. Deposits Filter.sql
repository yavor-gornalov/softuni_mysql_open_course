USE gringotts;

SELECT 
    wd.deposit_group,
    ROUND(SUM(wd.deposit_amount), 2) AS total_sum
FROM
    wizzard_deposits AS wd
WHERE
    wd.magic_wand_creator = 'Ollivander family'
GROUP BY wd.deposit_group
HAVING total_sum < 150000
ORDER BY total_sum DESC;