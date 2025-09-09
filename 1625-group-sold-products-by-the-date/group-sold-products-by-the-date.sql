/* Write your PL/SQL query statement below */
SELECT
  TO_CHAR(sell_date, 'YYYY-MM-DD')        AS sell_date,
  COUNT(product)                          AS num_sold,
  LISTAGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM (
  -- remove duplicate (same date & same product) and strip time part
  SELECT DISTINCT TRUNC(sell_date) AS sell_date, product
  FROM Activities
)
GROUP BY sell_date
ORDER BY sell_date;

