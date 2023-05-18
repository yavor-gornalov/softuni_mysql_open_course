USE geography;

SELECT 
    c.country_code, m.mountain_range, p.peak_name, p.elevation
FROM
    countries AS c
        JOIN
    mountains_countries AS mc USING (country_code)
        JOIN
    peaks AS p USING (mountain_id)
        JOIN
    mountains AS m ON mc.mountain_id = m.id
WHERE
    c.country_code = 'BG'
        AND p.elevation > 2835
ORDER BY p.elevation DESC;