# Write your MySQL query statement below
with cte as (
select customer_id,visited_on, amount,
sum(amount) over (order by visited_on range between interval
 6 day preceding and current row 
 )as sales
from Customer  
group by 1,2
)
select distinct a.visited_on,a.sales as amount, round(a.sales/7,2) 
as average_amount 
from cte a, cte b
 where datediff(a.visited_on,b.visited_on)>=6
 order by 1
