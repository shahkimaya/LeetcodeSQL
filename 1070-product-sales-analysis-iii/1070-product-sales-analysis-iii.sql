# Write your MySQL query statement below
with a as(
select product_id, year, quantity, price,
dense_rank() over(partition by product_id order by year) as rank_py
 from Sales)
 select product_id, year as first_year, quantity, price from a where rank_py =1