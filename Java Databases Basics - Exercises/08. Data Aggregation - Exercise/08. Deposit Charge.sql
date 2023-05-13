USE gringotts;

SELECT 
    wd.deposit_group, wd.magic_wand_creator, min( wd.deposit_charge) as min_deposit_charge
FROM
    wizzard_deposits AS wd
GROUP BY wd.deposit_group , wd.magic_wand_creator
ORDER BY wd.magic_wand_creator , wd.deposit_group;