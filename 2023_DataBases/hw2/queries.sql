
-- Код к заданию 1
SELECT name, author, year_of_publication 
FROM book
WHERE year_of_publication > 1975 AND name LIKE 'М%';


-- Код к заданию 2
SELECT actor.id, actor.name, actor.birth_date, actor.country, actor.has_oscar
FROM actor
  JOIN acting 
    ON actor.id = acting.actor_id
  JOIN film 
    ON acting.film_id = film.id
WHERE film.name = 'The Mask';


-- Код к заданию 3
SELECT car.number, car.make, car.model, status.name AS status
FROM car
JOIN status ON car.status = status.id;


-- Код к заданию 4

-- 1
SELECT
    department,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employee
GROUP BY department;

--2
SELECT 
    department, 
    name 
FROM employee
WHERE salary > (  
      SELECT AVG(e.salary)  -- средняя зарплата для данного департамента
      FROM employee e  -- подзапрос департамента
      WHERE employee.department = e.department
  );

--3
SELECT
    department,
    COUNT(*) AS employee_count -- подсчитываем сотрудников в каждом департаменте
FROM employee
WHERE salary > 10000 -- у моих сотрудников нарандомилась небольшая зарплата, поэтому я уменьшила до 10000
GROUP BY department;


-- Код к заданию 5

-- проанализируем данный запрос:
SELECT id, name, address, post, category, breed
FROM SimsCharacter
LEFT JOIN SimsPet ON SimsCharacter.pet = SimsPet.id AND SimsPet.character = 'cat' -- проблема в этой строке, так как в схеме SimsPet нет столбца 'character'

--исправленный вариант 1:
SELECT name, address, post, category, breed, pet
FROM SimsCharacter
LEFT JOIN SimsPet ON SimsCharacter.pet = SimsPet.id
WHERE SimsPet.category = 'cat';


--исправленный вариант 2 с использованием подзапроса вместо явного указания условия в WHERE:
SELECT name, address, post, category, breed, pet
FROM SimsCharacter
LEFT JOIN SimsPet ON SimsCharacter.pet = SimsPet.id
WHERE SimsCharacter.pet IN (SELECT id FROM SimsPet WHERE category = 'cat');


-- и еще вот такое можно
SELECT name, address, post, category, breed, pet
FROM SimsCharacter
LEFT JOIN SimsPet ON SimsCharacter.pet = SimsPet.id AND SimsPet.category = 'cat'
WHERE SimsPet.category IS NOT NULL;
