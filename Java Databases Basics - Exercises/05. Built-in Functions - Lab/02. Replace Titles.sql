USE `book_library`;

SELECT 
    REPLACE(`title`, 'The', '***')
FROM
    `books`
WHERE
    SUBSTR(`title` FROM 1 FOR 3) = 'The'
ORDER BY `id`;	
