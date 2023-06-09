USE geography;

SELECT 
    s.continent_code,
    r.currency_code,
    COUNT(*) AS currency_usage
FROM
    currencies AS r
        JOIN
    countries AS t USING (currency_code)
        JOIN
    continents AS s USING (continent_code)
GROUP BY s.continent_code , r.currency_code
HAVING currency_usage = (SELECT 
        COUNT(*) AS freequency
    FROM
        currencies AS r1
            JOIN
        countries AS t1 USING (currency_code)
    WHERE
        t1.continent_code = s.continent_code
    GROUP BY r1.currency_code
    ORDER BY freequency DESC
    LIMIT 1)
    AND currency_usage > 1
ORDER BY s.continent_code , r.currency_code;
