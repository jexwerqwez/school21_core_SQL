CREATE UNIQUE INDEX idx_menu_unique ON menu USING BTREE (pizzeria_id, pizza_name);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT * FROM menu WHERE pizza_name = 'cheese pizza' AND (pizzeria_id = 6 OR pizzeria_id = 1);