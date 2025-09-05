SELECT c.category,
       COALESCE(cnt.accounts_count, 0) AS accounts_count
FROM (
    SELECT 'Low Salary' AS category FROM dual UNION ALL
    SELECT 'Average Salary' FROM dual UNION ALL
    SELECT 'High Salary' FROM dual
) c
LEFT JOIN (
    SELECT CASE
               WHEN income < 20000 THEN 'Low Salary'
               WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
               ELSE 'High Salary'
           END AS category,
           COUNT(*) AS accounts_count
    FROM Accounts
    GROUP BY CASE
                 WHEN income < 20000 THEN 'Low Salary'
                 WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
                 ELSE 'High Salary'
             END
) cnt
ON c.category = cnt.category;