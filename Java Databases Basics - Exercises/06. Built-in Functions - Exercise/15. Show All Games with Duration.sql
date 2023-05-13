USE `diablo`;

SELECT 
	`name`,
	CASE
		WHEN hour(`start`) < 12 THEN "Morning"
		WHEN hour(`start`) < 18 THEN "Afternoon"
		ELSE "Evening"
	END as `Part of the Day`, 
	CASE
		WHEN `duration` <= 3 THEN "Extra Short"
		WHEN `duration` <= 6 THEN "Short"
        WHEN `duration` <= 10 THEN "Long"
		ELSE "Extra Long"
	END as `Duration` 
FROM `games`;


