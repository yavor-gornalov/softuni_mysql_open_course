USE gringotts;

SELECT 
    COUNT(wd.`id`) AS count
FROM
    wizzard_deposits AS wd;