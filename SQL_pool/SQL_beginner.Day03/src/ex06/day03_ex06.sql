SELECT menu1.pizza_name, pz1.name AS pizzeria_name_1, pz2.name AS pizzeria_name_2, menu1.price
FROM menu AS menu1 JOIN menu AS menu2 ON menu1.price = menu2.price
JOIN pizzeria AS pz1 ON pz1.id = menu1.pizzeria_id JOIN pizzeria AS pz2 ON pz2.id = menu2.pizzeria_id
WHERE menu1.pizza_name = menu2.pizza_name AND menu1.id > menu2.id
ORDER BY pizza_name;