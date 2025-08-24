SELECT 
    e.reports_to AS employee_id,
    m.name,
    COUNT(*) AS reports_count,
    ROUND(AVG(e.age)) AS average_age
FROM Employees e LEFT
JOIN Employees m
    ON e.reports_to = m.employee_id   -- join employee to their manager
WHERE e.reports_to IS NOT NULL        -- exclude top-level employees
GROUP BY e.reports_to, m.name
ORDER BY employee_id;
