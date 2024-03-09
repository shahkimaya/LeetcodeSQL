# Write your MySQL query statement below
with a as (select id,num,lag(num) over(order by id) as next,
 lead(num) over(order by id) as prev
from Logs
order by id)
 select distinct num as ConsecutiveNums from a where num=next and next=prev
