-- 1. User who rated the most movies
SELECT name AS results
FROM (
    SELECT u.name,
           COUNT(mr.movie_id) AS cnt
    FROM Users u
    JOIN MovieRating mr 
      ON u.user_id = mr.user_id
    GROUP BY u.name
    ORDER BY cnt DESC, u.name ASC
)
WHERE ROWNUM = 1

UNION ALL

-- 2. Movie with highest average rating in Feb 2020
SELECT title AS results
FROM (
    SELECT m.title,
           AVG(mr.rating) AS avg_rating
    FROM Movies m
    JOIN MovieRating mr 
      ON m.movie_id = mr.movie_id
    WHERE TO_CHAR(mr.created_at, 'YYYY-MM') = '2020-02'
    GROUP BY m.title
    ORDER BY avg_rating DESC, m.title ASC
)
WHERE ROWNUM = 1;
