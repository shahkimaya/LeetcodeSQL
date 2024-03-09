# Write your MySQL query statement below
with a as (
select id, salary, dense_rank() over(order by salary desc) as sal_rank from Employee)

select max(salary) as SecondHighestSalary from a where sal_rank=2
-- select case when sal_rank=2 then isnull(salary,'null') as SecondHighestSalary from a