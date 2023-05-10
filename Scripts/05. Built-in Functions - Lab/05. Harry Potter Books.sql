USE `book_library`;

SELECT 
    `title`
FROM
    `books`
WHERE
    INSTR(`title`, 'Harry Potter') > 0
ORDER BY `id`;