-- 1
-- What are the column names?

 select * from users limit 5;
-- 2
-- Find the email addresses and birthdays of users whose 
-- birthday is between 1980-01-01 and 1989-12-31.

   select * from users where birthday between '1980-01-01' 
   and '1989-12-31'
   limit 5;
-- 3
-- Find the emails and creation date of users 
-- whose created_at date matches this condition.

select * from users where created_at < '2017-05-1' limit 5;

-- 4
-- Find the emails of the users who received the ‘bears’ test.
select * from users where test like 'bears' limit 5;

-- 5
-- Find all the emails of all users who 
-- received a campaign on website BBB.
select * from users WHERE campaign LIKE 'BBB%' LIMIT 10; 
 
-- 6
-- Find all the emails of all users who received ad copy 2 in 
-- their campaign.

select * from users WHERE campaign LIKE '%-2' LIMIT 5;



-- 7
-- Find the emails for all users who received both a campaign and a test. 
-- These users will have non-empty entries in the 
-- campaign and test columns.

SELECT campaign, test FROM users
 where campaign is not NULL and test is not null Limit 10; 

-- 
