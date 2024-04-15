WITH forgotten_menus AS
(SELECT * FROM menu
WHERE NOT EXISTS (SELECT menu_id FROM person_order WHERE menu_id = menu.id))
SELECT forgotten_menus.pizza_name, forgotten_menus.price, pizzeria.name AS pizzeria_name
FROM forgotten_menus JOIN pizzeria ON forgotten_menus.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price, pizzeria_name;