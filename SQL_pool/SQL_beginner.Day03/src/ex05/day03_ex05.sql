SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
LEFT JOIN person_order ON person_order.person_id = person_visits.person_id AND person_order.order_date = person_visits.visit_date
JOIN person ON person.id = person_visits.person_id
WHERE person.name = 'Andrey'
  AND person_order.id IS NULL
ORDER BY pizzeria_name;
