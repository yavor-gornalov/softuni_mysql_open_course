USE stc;

SELECT 
    c.make,
    c.model,
    c.condition
FROM
    cars as c ORDER BY c.id;