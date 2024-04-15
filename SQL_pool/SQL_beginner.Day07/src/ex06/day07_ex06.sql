SELECT pizzeria.name, COUNT(order_date) AS count_of_orders,
ROUND(AVG(price), 2) AS average_price,
MAX(price) AS max_price, MIN(price) AS min_price
FROM person_order JOIN menu ON menu_id = menu.id
JOIN pizzeria ON pizzeria_id = pizzeria.id
GROUP BY pizzeria.name ORDER BY pizzeria.name;