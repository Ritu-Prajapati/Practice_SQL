-- The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.

# Write your MySQL query statement below
select s.user_id, round(avg (if(c.action = 'confirmed', 1, 0)), 2) confirmation_rate 
from Signups s
left join Confirmations c
on c.user_id = s.user_id
group by user_id
