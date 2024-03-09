# Write your MySQL query statement below
-- with a as (
 #    select case when income<20000 then 'Low Salary'
 # when income between 20000 and 50000 then "Average Salary"
 # when income>50000 then "High Salary" end as category,
 #  coalesce(count(Account_id),0) as accounts_count
 #  from Accounts
 # group by category

-- )
-- select category, ifnull(count(category),0) as accounts_count from a group by 1
sELECT 'Low Salary' AS category, COUNT(account_id) AS accounts_count
FROM Accounts
WHERE income < 20000
UNION
SELECT 'Average Salary' AS category, COUNT(account_id) AS accounts_count
FROM Accounts
WHERE income >= 20000 AND income <= 50000
UNION
SELECT 'High Salary' AS category, COUNT(account_id) AS accounts_count
FROM Accounts
WHERE income > 50000;


