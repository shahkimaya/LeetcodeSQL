# Write your MySQL query statement below
select DATE_FORMAT(trans_date, '%Y-%m') AS month, country
, count(*) as trans_count,
 SUM(IF(state = 'approved', 1, 0)) AS approved_count,
 sum(amount) as trans_total_amount,
SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
 from Transactions
 group by country, month