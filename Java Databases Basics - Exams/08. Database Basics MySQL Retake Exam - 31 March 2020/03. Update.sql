USE instd;

UPDATE addresses AS a 
SET 
    a.country = (CASE
        WHEN LEFT(a.country, 1) = 'B' THEN 'Blocked'
        WHEN LEFT(a.country, 1) = 'T' THEN 'Test'
        WHEN LEFT(a.country, 1) = 'P' THEN 'In Progress'
        ELSE a.country
    END)
