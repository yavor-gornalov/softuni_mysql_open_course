USE restaurant_db;

INSERT INTO products (name, type, price)
SELECT 
	concat_ws(" ", w.last_name, "specialty") AS name, 
	"Cocktail" AS type, 
	ceil(0.01 * w.salary) AS price 
FROM waiters AS w 
WHERE w.id > 6;