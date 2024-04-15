WITH female_orders AS
(SELECT name, pizza_name FROM person
JOIN person_order ON person_id = person.id
JOIN menu ON menu_id = menu.id
WHERE gender = 'female')
SELECT female_orders.name FROM female_orders WHERE pizza_name = 'pepperoni pizza'
INTERSECT
SELECT female_orders.name FROM female_orders WHERE pizza_name = 'cheese pizza';