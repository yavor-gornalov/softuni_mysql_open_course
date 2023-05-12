USE `diablo`;

SELECT 
    `user_name`,
    REPLACE(`email`,
        LEFT(`email`, POSITION('@' IN `email`)),
        '') AS `email provider`
    /* SUBSTRING(`email`,
        LOCATE('@', email) + 1) AS `email provider` */
FROM
    `users`
ORDER BY `email provider` , `user_name`;