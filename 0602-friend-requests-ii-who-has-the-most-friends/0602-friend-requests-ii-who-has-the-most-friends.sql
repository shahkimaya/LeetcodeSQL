# Write your MySQL query statement below
with a as (
select requester_id as id  from RequestAccepted 
union all
select accepter_id as id from RequestAccepted)
select id , count(1) as num from a group by 1
order by num desc limit 1