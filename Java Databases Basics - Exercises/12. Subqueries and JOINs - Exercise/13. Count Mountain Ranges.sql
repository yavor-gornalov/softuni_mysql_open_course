USE geography;

SELECT 
    c.country_code, COUNT(*) AS mountain_range
FROM
    countries AS c
        JOIN
    mountains_countries AS mc USING (country_code)
GROUP BY c.country_code
HAVING c.country_code IN ('BG' , 'RU', 'US')
ORDER BY mountain_range DESC;