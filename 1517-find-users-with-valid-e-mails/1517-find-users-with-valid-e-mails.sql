# Write your MySQL query statement below
select * from Users where lower(mail) regexp '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode[.]com$'