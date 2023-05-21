USE softuni_imdb;

UPDATE movies_additional_info AS mai 
SET 
    mai.runtime = mai.runtime - 10
WHERE
    mai.id BETWEEN 15 AND 25;
