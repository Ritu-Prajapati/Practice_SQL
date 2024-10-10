#Ques- There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process.
# The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.
# The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.
# Return the result table in any order.

# Write your MySQL query statement below
SELECT 
    start_activity.machine_id
   , round(avg(end_activity.timestamp- start_activity.timestamp), 3 ) as processing_time
FROM 
    Activity start_activity
JOIN 
    Activity end_activity
ON 
    start_activity.machine_id = end_activity.machine_id
    AND start_activity.process_id = end_activity.process_id
    AND start_activity.activity_type = 'start'
    AND end_activity.activity_type = 'end'
GROUP BY
 end_activity.machine_id;