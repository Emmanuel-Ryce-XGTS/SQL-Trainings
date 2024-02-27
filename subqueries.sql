### Subqueries learning and more

SELECT first_name, last_name
FROM band_students
WHERE id IN (
   SELECT id From 
drama_students);



DELETE FROM drama_students
WHERE id in (
   SELECT id
   FROM band_students
   WHERE grade = 9);

SELECT * 
FROM drama_students
WHERE grade = (
  SELECT grade
  FROM band_students
  WHERE id = 20);


SELECT first_name, last_name
FROM band_students
WHERE id 
NOT IN (
  SELECT id
  FROM drama_students);


SELECT grade
FROM band_students
WHERE  
EXISTS (
  SELECT grade
  FROM drama_students);
