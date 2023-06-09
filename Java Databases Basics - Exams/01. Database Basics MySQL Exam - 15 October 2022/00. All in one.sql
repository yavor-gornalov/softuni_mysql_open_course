CREATE SCHEMA restaurant_db;
USE restaurant_db;

-- 01. Table Design 

CREATE TABLE products (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30) NOT null unique,
	type VARCHAR(30) not null,
	price DECIMAL(10,2) not null
);

CREATE TABLE clients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    card VARCHAR(50),
    review TEXT
);

create table tables (
	id int primary key AUTO_INCREMENT,
	floor int not null,
	reserved TINYINT(1),
	capacity int not null
);

CREATE TABLE waiters (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(50),
    salary DECIMAL(10 , 2 )
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    table_id INT NOT NULL,
    waiter_id INT NOT NULL,
    order_time TIME NOT NULL,
    payed_status TINYINT(1),
    CONSTRAINT fk_orderst_tables FOREIGN KEY (table_id)
        REFERENCES tables (id),
    CONSTRAINT fk_orderst_waiters FOREIGN KEY (waiter_id)
        REFERENCES waiters (id)
);

CREATE TABLE orders_clients (
    order_id INT,
    client_id INT,
    CONSTRAINT fk_orders_clients_orders FOREIGN KEY (order_id)
        REFERENCES orders (id),
    CONSTRAINT fk_orders_clients_clients FOREIGN KEY (client_id)
        REFERENCES clients (id)
);

create table orders_products (
	order_id int,
	product_id int,
    CONSTRAINT fk_orders_products_orders FOREIGN KEY (order_id) REFERENCES orders(id),
    CONSTRAINT fk_orders_products_products FOREIGN KEY (product_id) REFERENCES products(id)
);

-- 02. Insert

INSERT into products(name, type, price)
SELECT 
    CONCAT(w.last_name, ' ', 'specialty') as name,
    "Cocktail" as type,
    ceil(0.01 * w.salary) as price
FROM
    waiters AS w
WHERE
    w.id > 6;
    
 -- 03. Update    

UPDATE orders AS o 
SET 
    o.table_id = table_id - 1
WHERE
    o.id BETWEEN 12 AND 23;
    
-- 04. Delete 

DELETE w FROM waiters AS w
        LEFT JOIN
    orders AS o ON w.id = o.waiter_id 
WHERE
    o.waiter_id IS NULL;
    
-- 05. Clients 
    
SELECT 
    c.id,
    c.first_name,
    c.last_name,
    c.birthdate,
    c.card,
    c.review
FROM
    clients AS c
ORDER BY c.birthdate DESC , c.id DESC;

-- 06. Birthdate

SELECT 
    c.first_name, c.last_name, c.birthdate, c.review
FROM
    clients AS c
WHERE
    c.card IS NULL
        AND YEAR(c.birthdate) BETWEEN 1978 AND 1993
ORDER BY c.last_name DESC , c.id ASC
LIMIT 5; 

-- 07. Accounts 

SELECT 
    CONCAT(w.last_name,
            w.first_name,
            CHAR_LENGTH(w.first_name),
            'Restaurant') AS username,
    REVERSE(SUBSTR(w.email FROM 2 FOR 12)) AS password
FROM
    waiters AS w
WHERE
    w.salary IS NOT NULL
ORDER BY password DESC; 

-- 08. Top from menu 

SELECT 
    p.id, p.name, COUNT(*) AS count
FROM
    orders AS o
        JOIN
    orders_products AS op ON o.id = op.order_id
        JOIN
    products AS p ON op.product_id = p.id
GROUP BY p.id
HAVING count >= 5
ORDER BY count DESC , p.name ASC; 

-- 09. Availability

SELECT 
    t.id,
    t.capacity,
    COUNT(oc.client_id) AS count_clients,
    CASE
        WHEN COUNT(oc.client_id) < t.capacity THEN 'Free seats'
        WHEN COUNT(oc.client_id) = t.capacity THEN 'Full'
        ELSE 'Extra seats'
    END AS availability
FROM
    tables AS t
        JOIN
    orders AS o ON t.id = o.table_id
        JOIN
    orders_clients AS oc ON o.id = oc.order_id
WHERE
    t.floor = 1
GROUP BY t.id
ORDER BY t.id DESC;

-- 10. Extract bill

DELIMITER $$

CREATE FUNCTION udf_client_bill(full_name VARCHAR(50))
RETURNS DECIMAL(10,2)
DETERMINISTIC

BEGIN
RETURN (
	SELECT 
		sum(p.price) as bill
	FROM
		clients AS c
			JOIN
		orders_clients AS oc ON c.id = oc.client_id
			JOIN
		orders AS o ON oc.order_id = o.id
			JOIN
		orders_products AS op ON o.id = op.order_id
			JOIN
		products AS p ON op.product_id = p.id
	WHERE
		CONCAT_WS(' ', c.first_name, c.last_name) = full_name);
END$$

DELIMITER ;

SELECT 
    c.first_name,
    c.last_name,
    udf_client_bill('Silvio Blyth') AS 'bill'
FROM
    clients c
WHERE
    c.first_name = 'Silvio'
        AND c.last_name = 'Blyth';
        
-- 11. Happy hour 

DELIMITER $$

CREATE PROCEDURE udp_happy_hour(type VARCHAR(50))
BEGIN
	UPDATE products AS p
	SET p.price = 0.8 * p.price
	WHERE
		p.type = type and p.price >= 10;
END$$

DELIMITER ;

CALL udp_happy_hour ('Cognac');

