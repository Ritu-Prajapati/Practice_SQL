-- Calculate  CTR click through rate for marketing campaign
-- where CTR = no. of clicks / no. of views 
-- Using case 

SELECT c.camp_id , c.channel , (SUM(CASE WHEN ck.action = "clicked" THEN 1 ELSE 0 END)/
  NULLIF(SUM(CASE WHEN ck.action = "viewed" THEN 1 ELSE 0 END),0))* 100 as CTR
FROM campaign c
LEFT JOIN click ck ON c.camp_id = ck.camp_id
GROUP BY c.camp_id , c.channel;

--NOTE : NULLIF(exp1 , exp2) > if exp 1 = exp2 then it prints null if not it execute exp1
