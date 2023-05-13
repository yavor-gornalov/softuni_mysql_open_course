USE soft_uni;

SELECT 
    e.department_id,
    (SELECT DISTINCT
            e_inner.salary
        FROM
            employees AS e_inner
        WHERE
            e.department_id = e_inner.department_id
        ORDER BY e_inner.salary DESC
        LIMIT 2 , 1) AS third_highest_salary
FROM
    employees AS e
GROUP BY e.department_id
HAVING third_highest_salary IS NOT NULL
ORDER BY e.department_id;