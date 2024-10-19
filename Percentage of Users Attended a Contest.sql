--Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
--Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

-- Write your MySQL query statement below
with contestregisteration as (
    select contest_id ,count(distinct user_id) as registered_users 
    from Register 
    group by contest_id),  -- this table is for total no. of user based on contest_id

totalusers as (
    select count(*) as total_user
    from Users            -- this table is for total no. of user played 
)
Select contest_id , round((registered_users*100/total_user),2) as percentage
from contestregisteration c
cross join totalusers t      -- cross joins is used because total no. of user gives single row and contestregisteration gives multiple rowsa and  attaches the total number of users to every contest registration
order by percentage desc, contest_id asc
