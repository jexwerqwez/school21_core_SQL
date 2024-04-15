SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM menu m JOIN pizzeria ON pizzeria.id = pizzeria_id;