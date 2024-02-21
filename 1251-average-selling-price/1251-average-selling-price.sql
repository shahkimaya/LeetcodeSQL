# Write your MySQL query statement below
with cte as (
select p.*, u.units, price* units as pp
from Prices p left join UnitsSold u 
on p.product_id = u.product_id 
and u.purchase_date between p.start_date and p.end_date
)
, a as (select product_id, sum(units) as number_sold
from cte
group by 1),
 b as (select product_id, sum(pp) as total_purchase   from cte
 group by 1)

 select a.product_id, coalesce(round(b.total_purchase/a.number_sold,2),0) as average_price 
 from a join b on a.product_id = b.product_id