-- SELECT *
-- FROM social_media;

-- SELECT 
--   username, SUM(change_in_followers)
-- FROM
--   social_media
-- WHERE
--   username = 'instagram'
-- GROUP BY
--   username;

-- SELECT 
--    month,
--    change_in_followers,
--    SUM(change_in_followers) OVER (
--       ORDER BY month
--    ) AS 'running_total'
-- FROM
--    social_media
-- WHERE
--    username = 'instagram';

-- SELECT username,
--    posts,
--    FIRST_VALUE (posts) OVER (
--       PARTITION BY username 
--       ORDER BY posts
--    ) AS 'fewest_posts'
-- FROM social_media;

SELECT
   username,
   posts,
   LAST_VALUE (posts) OVER (
      PARTITION BY username 
      ORDER BY posts
      RANGE BETWEEN UNBOUNDED PRECEDING AND 
      UNBOUNDED FOLLOWING
    ) most_posts
FROM
    social_media;


SELECT
   artist,
   week,
   streams_millions,
   streams_millions - LAG(streams_millions, 1, streams_millions) OVER ( 
      PARTITION BY artist
      ORDER BY week 
   ) AS 'streams_millions_change',
   chart_position,
   LAG(chart_position, 1, chart_position) OVER ( 
      PARTITION BY artist
      ORDER BY week 
) - chart_position AS 'chart_position_change'
FROM
   streams
WHERE artist = 'Lady Gaga';


SELECT 
   ROW_NUMBER() OVER (
      ORDER BY streams_millions DESC
   ) row_num, 
   artist, 
   week,
   streams_millions
FROM
   streams;


SELECT 
   RANK() OVER (
      PARTITION BY week
      ORDER BY streams_millions DESC
   ) AS 'rank', 
   artist, 
   week,
   streams_millions
FROM
   streams;


SELECT 
   NTILE(4) OVER (
      PARTITION BY week
      ORDER BY streams_millions DESC
   ) AS 'quartile', 
   artist, 
   week,
   streams_millions
FROM
   streams;

SELECT DATETIME(order_date, 'start of day', '+2 days', '+7 hours')
FROM bakery;

SELECT strftime('%d', order_date) AS 'order_day',
  COUNT(*) 
FROM bakery 
GROUP BY 1
ORDER BY 2 DESC;


SELECT item_name, (price - CAST(discount AS REAL)) * quantity
FROM bakery;

