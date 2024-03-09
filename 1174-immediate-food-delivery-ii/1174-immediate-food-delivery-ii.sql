# Write your MySQL query statement below
with a as (
select *, case when order_date = customer_pref_delivery_date then 'Immediate'
else 'Scheduled' end as order_status 
#dense_rank() over(partition by customer_id order by order_status ) as rank_order
from Delivery
order by customer_id, order_date)
, b as (
select *, dense_rank() over(partition by customer_id order by order_date) as rd
 from a),
 c as (select * from b where rd = 1 )
 select round( (count(case when order_status='Immediate' then 1 end) /count(customer_id))* 100,2) as immediate_percentage from c 