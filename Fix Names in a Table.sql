select user_id , 
concat(ucase(left(name, 1)),lcase(substring(name,2))) as name 
from users 
order by user_id
