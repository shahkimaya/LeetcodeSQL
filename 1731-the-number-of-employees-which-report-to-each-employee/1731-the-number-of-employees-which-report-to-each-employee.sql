# Write your MySQL query statement below
with a as(
select e.employee_id as eid,m.name,e.age,m.employee_id as md from Employees e 
join Employees m on e.reports_to=m.employee_id

)
select md as employee_id, name, 
count(eid) as reports_count, round(avg(age)) as average_age
 from a 
group by 1,2
order by 1