USE instd;

SELECT 
    u.username, u.gender, u.age
FROM
    users AS u
ORDER BY u.age DESC , u.username ASC;