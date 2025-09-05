WITH DailySales AS (
    -- Step 1: Get daily total sales
    SELECT
        visited_on,
        SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
),
SevenDayWindows AS (
    -- Step 2: For each day, sum the previous 7 days (including itself)
    SELECT
        d1.visited_on,
        SUM(d2.daily_amount) AS amount,
        ROUND(SUM(d2.daily_amount) / 7, 2) AS average_amount
    FROM DailySales d1
    JOIN DailySales d2
      ON d2.visited_on BETWEEN d1.visited_on - 6 AND d1.visited_on
    GROUP BY d1.visited_on
)
-- Step 3: Return only rows where a full 7-day window exists
SELECT
    TO_CHAR(visited_on, 'YYYY-MM-DD') AS visited_on,
    amount,
    average_amount
FROM SevenDayWindows
WHERE visited_on >= (SELECT MIN(visited_on) + 6 FROM DailySales)
ORDER BY visited_on;
