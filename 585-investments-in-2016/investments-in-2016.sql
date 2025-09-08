/* Write your PL/SQL query statement below */
SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance i
WHERE 
    -- Condition 1: tiv_2015 must appear more than once
    i.tiv_2015 IN (
        SELECT tiv_2015
        FROM Insurance
        GROUP BY tiv_2015
        HAVING COUNT(*) > 1
    )
    -- Condition 2: location (lat, lon) must be unique
    AND (i.lat, i.lon) IN (
        SELECT lat, lon
        FROM Insurance
        GROUP BY lat, lon
        HAVING COUNT(*) = 1
    );
