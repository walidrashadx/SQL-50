/* Write your PL/SQL query statement below */
SELECT
V.customer_id,
COUNT(V.visit_id) AS count_no_trans
FROM
Visits V
WHERE
V.visit_id NOT IN (
SELECT T.visit_id
FROM Transactions T
WHERE T.amount IS NOT NULL
)
GROUP BY
V.customer_id
ORDER BY
V.customer_id;