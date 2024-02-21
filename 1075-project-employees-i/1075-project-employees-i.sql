# Write your MySQL query statement below

with a as(
select p.project_id,sum(e.experience_years) as s,count(e.employee_id) as c
from Project p
join Employee e
on p.employee_id=e.employee_id
where e.experience_years is NOT NULL
group by 1
)
select a.project_id, round((s/c),2 ) as average_years from a