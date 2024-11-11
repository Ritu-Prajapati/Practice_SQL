-- Count the no of emp who are still in the hospital 
CREATE TABLE employee_actions (
    empid INT,
    action VARCHAR(10),
    timestamp DATETIME
);

INSERT INTO employee_actions (empid, action, timestamp) VALUES
    (1, 'in', '2022-12-02 09:00'),
    (1, 'out', '2022-12-02 09:15'),
    (2, 'in', '2022-12-02 09:00'),
    (2, 'out', '2022-12-02 09:15'),
    (2, 'in', '2022-12-02 09:30'),
    (3, 'out', '2022-12-02 09:00'),
    (3, 'in', '2022-12-02 09:15'),
    (3, 'out', '2022-12-02 09:30'),
    (3, 'in', '2022-12-02 09:45'),
    (4, 'in', '2022-12-02 09:45'),
    (5, 'out', '2022-12-02 09:40');

-- method 1
select empid from(
select empid, action , max(timestamp) from employee_actions
group by empid)
where action = "in"
  
  -- or method 2 using cte - common table expression
  
with cte as ( 
  select empid , 
  max(case when action = "in" then timestamp end) as intime ,
  max(case when action = "out" then timestamp end) as outtime 
from employee_actions
group by empid 
having max(case when action = "in" then timestamp end) > max(case when action = "out" then timestamp end)
or max(case when action = "out" then timestamp end) is null 
  )
select * from cte

-- method one is optimized
