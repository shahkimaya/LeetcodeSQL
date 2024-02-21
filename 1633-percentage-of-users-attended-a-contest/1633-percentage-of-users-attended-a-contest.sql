# Write your MySQL query statement below
with a as(
select r.contest_id, count(u.user_id) as no_users
from users u join Register r on u.user_id = r.user_id
group by 1)

, b as (SELECT COUNT(DISTINCT user_id) as tot_users FROM Users)
select a.contest_id,round(((a.no_users/b.tot_users)*100),2) as percentage
 from a, b
 order by 2 desc , 1