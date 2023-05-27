use stc;

UPDATE cars AS c 
SET 
    c.condition = 'C'
WHERE
    c.condition != 'C'
        AND (c.mileage >= 800000 OR c.mileage IS NULL)
        AND year <= 2010
        AND c.make != 'Mercedes-Benz';