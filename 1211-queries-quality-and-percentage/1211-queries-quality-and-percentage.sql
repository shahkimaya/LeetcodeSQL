# Write your MySQL query statement below
#with a as(
select query_name,round(avg(rating/position),2) as quality,
 round(sum(rating < 3)/count(*)*100,2) as poor_query_percentage
 from queries
 where query_name is NOT NULL
group by 1
#)

 #    select query_name, round((qua/ity),2) as quality from a
-- from a group by 1
-- )
-- select a.query_name, round(b.qual/b.ity,2)as quality ,(a.perce/b.ity)*100 as poor_query_percentage
-- from a,b
-- group by 1