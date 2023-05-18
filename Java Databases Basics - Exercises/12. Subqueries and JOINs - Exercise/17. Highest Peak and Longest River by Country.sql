use geography;

SELECT 
    c.country_name,
    (SELECT 
            elevation
        FROM
            peaks
                JOIN
            mountains_countries USING (mountain_id)
        WHERE
            country_code = c.country_code
        ORDER BY elevation DESC
        LIMIT 1) AS highest_peak_elevation,
    (SELECT 
            r.length
        FROM
            rivers AS r
                JOIN
            countries_rivers AS cr ON r.id = cr.river_id
        WHERE
            cr.country_code = c.country_code
        ORDER BY length DESC
        LIMIT 1) AS longest_river_length
FROM
    countries AS c
ORDER BY highest_peak_elevation DESC , longest_river_length DESC
LIMIT 5;