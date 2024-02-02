-- 1
-- What are the column names?
SELECT *
FROM orders
LIMIT 10;


-- 2 
-- How recent is this data?

select distinct order_date from orders;

-- 3
-- Instead of selecting all the columns using *, 
-- write a query that selects only the special_instructions column.

-- Limit the result to 20 rows.

select special_instructions from orders limit 20;

-- 4 
-- Can you edit the query so that we are only 
-- returning the special instructions that are not empty?

select special_instructions from orders
 where special_instructions is not null limit 20;
-- 5
-- Let’s go even further and sort the instructions 
-- in alphabetical order (A-Z).
select special_instructions from orders 
where special_instructions is not null  
order by special_instructions asc limit 20;


-- 6
-- Let’s search for special instructions that have the word ‘sauce’.

-- Are there any funny or interesting ones? 
select special_instructions from orders 
where special_instructions is not null
  and  special_instructions like '%sauce%';


-- 7
-- Let’s search for special instructions that have the word ‘door’.
-- Any funny or interesting ones?
select special_instructions from orders 
where special_instructions is not null
  and  special_instructions like '%door%';


-- 8
-- Let’s search for special instructions that have the word ‘box’.
-- Any funny or interesting ones?

select special_instructions from orders 
where special_instructions is not null
  and  special_instructions like '%box%';


-- 9
-- Instead of just returning the special instructions, also return their order ids.

-- For more readability:
-- Rename id as ‘#’
-- Rename special_instructions as ‘Notes’

select  id as '#', special_instructions AS 'Notes' from orders 
where special_instructions is not null
  and  special_instructions like '%box%';

 
