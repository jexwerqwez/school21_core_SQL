(SELECT pizzeria.name AS pizzeria_name FROM person
	JOIN person_order ON person.id = person_order.person_id
	JOIN menu ON person_order.menu_id = menu.id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	WHERE person.gender = 'female'
EXCEPT
SELECT pizzeria.name AS pizzeria_name FROM person
	JOIN person_order ON person.id = person_order.person_id
	JOIN menu ON person_order.menu_id = menu.id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	WHERE person.gender = 'male')
 
UNION

(SELECT pizzeria.name AS pizzeria_name FROM person
	JOIN person_order ON person.id = person_order.person_id
	JOIN menu ON person_order.menu_id = menu.id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	WHERE person.gender = 'male'
EXCEPT
SELECT pizzeria.name AS pizzeria_name FROM person
	JOIN person_order ON person.id = person_order.person_id
	JOIN menu ON person_order.menu_id = menu.id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	WHERE person.gender = 'female')

ORDER BY pizzeria_name;