-- 1
-- What are the column names?

SELECT *
FROM transaction_data
LIMIT 10;

-- 2
-- Find the full_names and emails
-- of the transactions listing 20252 as the zip code.

select full_name, email from transaction_data
where zip LIKE '%20252%';

-- 3
-- Use a query to find the names 
-- and emails associated with these transactions.

SELECT full_name, email
FROM transaction_data 
where full_name = 'Art Vandelay' 
   OR full_name LIKE '% der %';

-- 4
-- Find the ip_addresses and emails listed with these transactions.

SELECT ip_address, email from transaction_data where ip_address LIKE '10.%';
-- 5
-- Find the emails in transaction_data with
-- ‘temp_email.com’ as a domain.

SELECT email from transaction_data 
where email LIKE '%temp_email.com';

-- 6
-- The finance department is looking for a specific transaction. 
-- They know that the transaction occurred from an ip address starting 
-- with ‘120.’ and their full name starts with ‘John’.

-- Can you find the transaction?

SELECT *
FROM transaction_data 
where ip_address LIKE '120%' 
and full_name Like 'John%';

