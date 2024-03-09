# Write your MySQL query statement below
with a as 
(select turn, person_name, weight, 
sum(weight) over (order by turn) as sumofweight
 from Queue 
group by 1,2,3
order by turn )
, b as ( 
select *,dense_rank() over(order by sumofweight desc) as rw
 from a where sumofweight<=1000 )
 SELECT person_name FROM b where rw=1
