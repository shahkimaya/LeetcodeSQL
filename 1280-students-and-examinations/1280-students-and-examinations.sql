# Write your MySQL query statement below
select s1.student_id, s1.student_name, sub.subject_name , count(e.student_id) as attended_exams
from Students s1 cross join subjects sub
left outer join Examinations e
on s1.student_id = e.student_id and e.subject_name = sub.subject_name 

group by 1,2,3
order by 1