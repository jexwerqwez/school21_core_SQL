SELECT pizzeria.name AS pizzeria_name FROM pizzeria
JOIN person_visits ON pizzeria_id = pizzeria.id
JOIN person ON person_id = person.id
JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Dmitriy' AND price < 800 AND visit_date = '2022-01-08';