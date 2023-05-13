USE soft_uni;

SELECT 
    e.department_id, MIN(e.salary) AS minimum_salary
FROM
    employees AS e
WHERE
    e.department_id IN (2 , 5, 7)
        AND YEAR(e.hire_date) >= 2000
GROUP BY e.department_id
ORDER BY e.department_id;
