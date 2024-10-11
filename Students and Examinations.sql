--Ques. Write a solution to find the number of times each student attended each exam.
-- Return the result table ordered by student_id and subject_name.

#Write your MySQL query statement below
select s.student_id , s.student_name , su.subject_name , COUNT(e.student_id) attended_exams from Students s
cross join Subjects su  -- A CROSS JOIN generates all combinations of rows between two tables no need using "ON"
left join Examinations e 
on e.student_id = s.student_id  AND e.subject_name = su.subject_name 
group by  s.student_id, s.student_name , su.subject_name  -- retrieving each student's name, which comes from the Students table, not the Examinations table thus s.student_name ✔️ e.student_name ❌
order by s.student_id, su.subject_name  -- same logic 


