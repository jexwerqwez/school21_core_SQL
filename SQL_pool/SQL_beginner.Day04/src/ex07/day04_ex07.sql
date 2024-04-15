CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS (
SELECT pizzeria.name AS pizzeria_name FROM pizzeria
JOIN person_visits ON pizzeria_id = pizzeria.id
JOIN person ON person_id = person.id
JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Dmitriy' AND price < 800 AND visit_date = '2022-01-08'
);
INSERT INTO person_visits VALUES (
SELECT MAX(id) +1 FROM person_visits,
SELECT id FROM person WHERE name = 'Dmitriy',
SELECT  pizzeria_id FROM menu JOIN pizzeria ON pizzeria_id = pizzeria.id
WHERE price < 800 AND pizzeria.name != mv_dmitriy_visits_and_eats.pizzeria_name,
'2022-01-08');
REFRESH
MATERIALIZED VIEW mv_dmitriy_visits_and_eats;