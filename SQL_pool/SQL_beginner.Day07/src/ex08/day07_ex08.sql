SELECT address, pizzeria.name, COUNT(*) AS count_of_orders FROM person
JOIN person_order ON person_id = person.id
JOIN menu ON menu_id = menu.id
JOIN pizzeria ON pizzeria_id = pizzeria.id
GROUP BY pizzeria.name, address
ORDER BY address, pizzeria.name;