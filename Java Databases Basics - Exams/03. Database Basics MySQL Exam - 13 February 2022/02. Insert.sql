USE online_store;

INSERT INTO reviews (content,picture_url, published_at,rating) 
SELECT 
    left(p.description,15),
    reverse( p.name),
    "2010-10-10",
    p.price / 8
FROM
    reviews AS r
        JOIN
    products AS p ON r.id = p.review_id WHERE p.id >= 5;