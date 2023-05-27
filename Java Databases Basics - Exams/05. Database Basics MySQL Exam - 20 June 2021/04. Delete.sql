USE stc;

DELETE cl FROM clients AS cl
        LEFT JOIN
    courses AS c ON cl.id = c.client_id 
WHERE
    CHAR_LENGTH(cl.full_name)
    AND c.client_id IS NULL;