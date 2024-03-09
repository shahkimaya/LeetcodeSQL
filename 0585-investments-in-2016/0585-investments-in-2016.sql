# Write your MySQL query statement below
-- with a as(
-- select *, lag(tiv_2015) over(order by tiv_2015)  as lg15
-- from Insurance 
-- )
-- select *,case when tiv_2015=lg15 then pid else 0 end as pid15
-- from a
-- select * from Insurance where lat in (
-- select  lat -- , count(lat) 
-- from Insurance
--  group by 1
--  having count(lat)<=1
--  )
--  with a as (
-- select * from Insurance where tiv_2015 in (select  tiv_2015
--  from Insurance 
-- group by 1
-- having count(tiv_2015) >1
-- ) 
--  ) 
--  select round(sum(tiv_2016),2) as tiv_2016 
--  from a where concat(lat,lon) in (
-- select  concat(lat,lon) -- , count(lat) 
-- from Insurance
--  group by lat,lon
--  having count(concat(lat,lon))<=1
--  -- )


select round(sum(tiv_2016),2) as tiv_2016 from insurance
where tiv_2015 in
(select tiv_2015 from insurance group by tiv_2015 having count(tiv_2015) >1)
and concat(lat,lon) not in
(select concat(lat,lon) from insurance group by lat,lon
 having count(concat(lat,lon)) >1)