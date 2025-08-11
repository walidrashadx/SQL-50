/* Write your PL/SQL query statement below */
select 

pt.product_name, 
s.year,
s.price 

  from 
  product pt inner 
  join Sales  s on pt.product_id  =s.product_id 


