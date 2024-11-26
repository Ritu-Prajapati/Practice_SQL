# firstlogin (fl)
with fl as 
(
 select player_id , min(event_date) as fl_date
 from Activity 
 group by player_id
),
#consecutive_login (cl)
cl as
(
 select fl.player_id from fl
join Activity a
on a.player_id = fl.player_id
and a.event_date = date_add(fl.fl_date, interval 1 day)
)
select round(
    (select count(*) from cl)/
    (select count(*) from fl),
    2
)
as fraction
