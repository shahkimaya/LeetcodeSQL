# Write your MySQL query statement below

with a as (
select product_id, new_price, change_date,
dense_rank() over(partition by product_id order by change_date desc) as max_price
from Products 
where change_date<='2019-08-16' 
)

select distinct p.product_id, ifnull(a.new_price,10) as price
 from Products p left join a 
 on  p.product_id=a.product_id
 and a.max_price =1


