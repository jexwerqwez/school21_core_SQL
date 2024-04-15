SELECT pizza_name, pizzeria.name AS pizzeria_name FROM menu
JOIN pizzeria ON pizzeria.id = pizzeria_id
JOIN person_order ON menu.id = menu_id
JOIN person ON person.id = person_id
WHERE person.name = 'Anna' OR person.name = 'Denis'
ORDER BY pizza_name, pizzeria_name;