 select * from survey_responses  limit 10;


 select question_text, count(distinct user_id) from survey_responses group by 1;


SELECT *
FROM onboarding_modals
LIMIT 10;

SELECT modal_text,
	COUNT(DISTINCT user_id)
FROM onboarding_modals
GROUP BY 1
ORDER BY 1; 

SELECT modal_text,
  COUNT(DISTINCT CASE
    WHEN ab_group = 'control' THEN user_id
    END) as control_clicks,
    COUNT(DISTINCT CASE
    WHEN ab_group = 'variant' THEN user_id
    END) as variant_clicks
FROM onboarding_modals
GROUP BY modal_text
ORDER BY modal_text;


SELECT *
FROM browse
LIMIT 5;

SELECT *
FROM checkout
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

SELECT 
DISTINCT b.browse_date,
b.user_id,
c.user_id IS NOT NULL AS 'is_checkout'
p.user_id IS NOT NULL AS 'is_purchase'
FROM browse as b 
left join checkout as c on b.user_id = c.user_id
left join purchase as p on b.user_id = p.user_id

limit 50;


WITH funnels AS (
  SELECT DISTINCT b.browse_date,
     b.user_id,
     c.user_id IS NOT NULL AS 'is_checkout',
     p.user_id IS NOT NULL AS 'is_purchase'
  FROM browse AS 'b'
  LEFT JOIN checkout AS 'c'
    ON c.user_id = b.user_id
  LEFT JOIN purchase AS 'p'
    ON p.user_id = c.user_id)
SELECT count(*) as 'num_browse',
sum(is_checkout) as 'num_checkout',
sum(is_purchase) as 'num_purchase',
1.0 * SUM(is_checkout) / COUNT(user_id),
1.0 * SUM(is_purchase) / SUM(is_checkout)
from funnels;




WITH funnels AS (
  SELECT DISTINCT b.browse_date,
     b.user_id,
     c.user_id IS NOT NULL AS 'is_checkout',
     p.user_id IS NOT NULL AS 'is_purchase'
  FROM browse AS 'b'
  LEFT JOIN checkout AS 'c'
    ON c.user_id = b.user_id
  LEFT JOIN purchase AS 'p'
    ON p.user_id = c.user_id)
SELECT browse_date,
COUNT(*) AS 'num_browse',
   SUM(is_checkout) AS 'num_checkout',
   SUM(is_purchase) AS 'num_purchase',
   1.0 * SUM(is_checkout) / COUNT(user_id) AS 'browse_to_checkout',
   1.0 * SUM(is_purchase) / SUM(is_checkout) AS 'checkout_to_purchase'
FROM funnels
GROUP BY browse_date
ORDER BY browse_date
;
