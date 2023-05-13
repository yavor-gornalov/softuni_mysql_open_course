USE soft_uni;

SELECT 
    e.first_name, e.last_name, e.department_id
FROM
    employees AS e
WHERE
    e.salary > (SELECT 
            AVG(e_inner.salary)
        FROM
            employees AS e_inner
        WHERE
            e_inner.department_id = e.department_id)
ORDER BY e.department_id , e.employee_id
LIMIT 10;
