#Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

# Write your MySQL query statement below
select e.name , b.bonus from Employee e 
left join Bonus b
on  b.empId = e.empId
where b.bonus < 1000 or b.bonus is null -- since it says print all the names add is null gives the chance to those as well who didnt received bonus 

