/* Write your PL/SQL query statement below */
select s.product_id, s.year first_year, s.quantity, s.price
from sales s
where s.year = (select min(year) from sales where product_id=s.product_id);