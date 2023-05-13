USE gringotts;

SELECT 
    CASE
        WHEN wd.age < 11 THEN '[0-10]'
        WHEN wd.age < 21 THEN '[11-20]'
        WHEN wd.age < 31 THEN '[21-30]'
        WHEN wd.age < 41 THEN '[31-40]'
        WHEN wd.age < 51 THEN '[41-50]'
        ELSE '[61+]'
    END AS age_group,
    COUNT(wd.age) AS wizard_count
FROM
    wizzard_deposits AS wd
GROUP BY age_group
ORDER BY age_group;