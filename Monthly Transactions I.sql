-- Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

select DATE_FORMAT(trans_date, '%Y-%m') as month,
        country ,
        count(id) as trans_count , 
        count(case when state = 'approved' then id end) as approved_count ,
        sum(amount) as trans_total_amount , 
        sum(case when state = 'approved' then amount end) as approved_total_amount
from Transactions 
group by month(trans_date) , country 

-- note why we are not using this- (case when state = 'approved' then count(id) end) # this will count the null values as well where state ="approved" thus count(where the state is approved)
