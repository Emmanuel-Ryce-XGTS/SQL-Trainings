select count(*) from users where email like '%com';

select first_name, COUNT(*) as 'COUNT' from users 
group by first_name 
order by 2 desc; 


SELECT
  ROUND(watch_duration_in_minutes,0) as duration,
  COUNT(*) as count
FROM watch_history
GROUP BY duration
ORDER BY duration ASC;


SELECT user_id, SUM(amount) AS amounts
FROM payments
WHERE status = 'paid'
GROUP BY user_id
ORDER BY amounts DESC;


select user_id,
sum(watch_duration_in_minutes) as duration 
from watch_history
group by user_id having duration > 400;


SELECT ROUND(SUM(watch_duration_in_minutes), 0) 
 from watch_history


SELECT pay_date AS day,
   SUM(amount) AS total
FROM payments
WHERE status = 'paid'
GROUP BY day
ORDER BY total DESC;


select avg(amount) from payments
where status = 'paid'


SELECT
  MAX(watch_duration_in_minutes) AS max,
  MIN(watch_duration_in_minutes) AS min
FROM watch_history;
