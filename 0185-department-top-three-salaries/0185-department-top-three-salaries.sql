# Write your MySQL query statement below
with a as (select d.name as Department, e.name as Employee, e.salary as Salary, 
dense_rank() over(partition by d.name order by salary desc) as salrank
from Employee e join Department d on e.departmentId=d.id
 order by e.salary desc )
 select Department, Employee, Salary from a where salrank<=3
 order by 1