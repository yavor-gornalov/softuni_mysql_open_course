use geography;

SELECT 
    COUNT(*)
FROM
    countries AS c
        LEFT JOIN
    mountains_countries AS mc USING (country_code)
WHERE
    mountain_id IS NULL;