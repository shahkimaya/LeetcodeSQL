# Write your MySQL query statement below
with a as(
select distinct m.name, e.managerId,count(e.id) as no_of_reporting_emp from 
Employee e join Employee m  on e.managerID = m.id
group by 2
)
select name from a where no_of_reporting_emp>=5