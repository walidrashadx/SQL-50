# Write your MySQL query statement below
select p.person_name
from (select person_name,
sum(Weight) over(order by turn)as rn
from Queue) p
where rn<=1000
order by rn desc
limit 1