-- pivot the region sales according to subcategory

select Sub_Category , 
round(sum(case when Region = 'East' then Sales else 0 end),2) as 'East',
round(sum(case when Region = 'West' then Sales else 0 end),2) as 'West',
round(sum(case when Region = 'North' then Sales else 0 end),2) as 'North',
round(sum(case when Region = 'South' then Sales else 0 end),2) as 'South'
from table_1
group by Sub_Category;

-- output
Subcategory  |East    | West   |North   |South   |
Bookcases    | 0      | 0      | 0      | 261.96 |
Chairs       | 71.37  | 0      | 0      | 731.94 |
Labels       | 0      | 14.62  | 0      | 0      |
Tables       | 0      | 2750.81| 0      | 957.58 |
Storage      | 0      | 55.5   | 0      | 22.37  |
Furnishings  | 0      | 48.86  | 0      | 0      |
Art          | 0      | 15.84  | 0      | 0      |
Phones       | 0      | 2032.06| 0      | 0      |
