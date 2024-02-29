# Write your MySQL query statement below
with a as
 (select s.user_id,c.time_stamp,c.action, case when action ='confirmed' then 1 else 0 end as status
from Signups s left join Confirmations c on s.user_id = c.user_id )


select user_id, round(count(case when status=1 then 1 end)/count(status) ,2) as confirmation_rate
from a group by 1