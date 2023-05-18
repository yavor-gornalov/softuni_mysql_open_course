USE geography;

SELECT 
	helper.continent_code,
	helper.currency_code,
	helper.currency_usage
FROM continents AS c
	JOIN
	(SELECT continent_code,
	   currency_code,
       COUNT(currency_code) as currency_usage,
	   
	   DENSE_RANK() OVER (PARTITION BY continent_code
	                      ORDER BY COUNT(currency_code) DESC
						  ) AS frequency_rank
	   FROM countries
		GROUP BY continent_code, currency_code
		HAVING COUNT(currency_code) > 1) AS helper 
    ON c.continent_code = helper.continent_code 
    WHERE helper.frequency_rank = 1