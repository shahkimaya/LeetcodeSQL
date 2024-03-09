# Write your MySQL query statement below
with a as 
(select num , coalesce(count(num),null) as cnt from MyNumbers group by 1)
select case when cnt =1 then num else null end as num
from a 
 order by num desc limit 1