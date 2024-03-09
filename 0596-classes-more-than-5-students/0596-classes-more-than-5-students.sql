# Write your MySQL query statement below
with a as (
    select class, count(class) as cc from Courses group by 1
-- order by class
)
, b as (
 select class, sum(cc) as cnt from a group by 1
)
select class from b  where cnt>=5