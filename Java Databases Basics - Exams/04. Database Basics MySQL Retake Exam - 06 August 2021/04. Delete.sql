USE sgd;

DELETE g FROM games AS g
        LEFT JOIN
    games_categories AS gc ON g.id = gc.game_id 
WHERE
    g.release_date IS NULL
    AND gc.category_id IS NULL;