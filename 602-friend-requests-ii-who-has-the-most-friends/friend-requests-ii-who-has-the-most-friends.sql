WITH AllFriends AS (
   -- Treat friendships as bidirectional
    SELECT requester_id AS id, accepter_id AS friend_id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id, requester_id AS friend_id
    FROM RequestAccepted
),
FriendCount AS (
    --Count friends per user
    SELECT 
        id,
        COUNT(DISTINCT friend_id) AS num
    FROM AllFriends
    GROUP BY id
)
-- Get the person(s) with the maximum friends
SELECT id, num
FROM FriendCount
WHERE num = (SELECT MAX(num) FROM FriendCount);
