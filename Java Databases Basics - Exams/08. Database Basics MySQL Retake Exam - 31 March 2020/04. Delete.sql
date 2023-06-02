USE instd;

DELETE a FROM addresses AS a 
WHERE
    a.id MOD 3 = 0;