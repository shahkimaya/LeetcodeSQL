# Write your MySQL query statement below
with a as (select employee_id, manager_id from Employees where salary <30000 )
select employee_id from a where a.manager_id not in (select employee_id from Employees)
order by 1