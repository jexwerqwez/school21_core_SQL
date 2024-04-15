SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person_id = person.id
WHERE person.name = 'Kate' AND price BETWEEN 800 AND 10000
ORDER BY pizza_name, price, pizzeria_name;