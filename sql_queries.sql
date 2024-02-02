SELECT *
FROM browse
LIMIT 10;

select year, number from babies where name = 'Lillian'

SELECT DISTINCT name FROM  babies WHERE name LIKE 'S%' limit 20;

SELECT name, gender, number
FROM babies
WHERE year = 1880
ORDER BY number DESC
limit 10;


SELECT * FROM nomnom  where cuisine = 'Japanese' and price = '$$'

SELECT * FROM nomnom where name Like '%noodle%'


SELECT title, publisher FROM news order by title asc
 
select * from nomnom WHERE health IS NULL


select * from news where title Like '%bitcoin%'


select * from news where category = 'b'
order by timestamp desc
limit 20




SELECT utm_source,
 	COUNT(DISTINCT user_id) AS num_users
FROM page_visits
GROUP BY 1
ORDER BY 2 DESC;





