# Write your MySQL query statement below
select x.id from weather x, weather y 
where datediff(x.recordDate,y.recordDate)=1 and x.temperature > y.temperature