 select * from met limit 10;

 select count(*) from met;


 select count(*) from met where category = '%celery%';


 select min(date) from met ;


 select country, count(*) from met
 group by country
 order by count(*) desc
 limit 10;


select category, count(*) from met 
group by 1
 having count(category) > 100;


select medium, count(*) from met 
WHERE medium LIKE '%gold%'
   OR medium LIKE '%silver%'
GROUP BY 1
ORDER BY 2 DESC;

