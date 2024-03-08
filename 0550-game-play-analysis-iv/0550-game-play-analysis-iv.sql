# Write your MySQL query statement below
with a as (
select *, lead(event_date) over(partition by player_id order by event_date) as ra,
datediff(lead(event_date) over(partition by player_id order by event_date),event_date)
as dd
from Activity)
, b as (select *, dense_rank() over(partition by player_id order by event_date) as rdp
from a 
)
#select * from b 
select round(count(case when b.dd=1 and b.rdp =1 then 1 end)/count(distinct player_id),2) as fraction from b