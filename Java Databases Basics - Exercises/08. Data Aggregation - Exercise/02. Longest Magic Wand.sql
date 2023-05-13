USE gringotts;

SELECT 
    max(wd.`magic_wand_size`) AS longest_magic_wand
FROM
    wizzard_deposits AS wd;