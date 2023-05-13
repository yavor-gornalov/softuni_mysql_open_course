USE `geography`;

SELECT 
    `country_name`, `iso_code`
FROM
    `countries`
WHERE
	`country_name` LIKE "%a%a%a%"
    -- CHAR_LENGTH(`country_name`) - CHAR_LENGTH(REPLACE(UPPER(`country_name`), 'A', '')) > 2
ORDER BY `iso_code`;