WITH tmp_cte AS (
	SELECT person_order.person_id, menu.pizzeria_id
	FROM person_order JOIN menu ON person_order.menu_id = menu.id
)

INSERT INTO person_discounts
	SELECT ROW_NUMBER() OVER(), tmp_cte.person_id, tmp_cte.pizzeria_id,
	CASE WHEN COUNT(tmp_cte.person_id) = 1 THEN 10.5
		 WHEN COUNT(tmp_cte.pizzeria_id) = 2 THEN 22
		 ELSE 30 END
	FROM tmp_cte GROUP BY tmp_cte.person_id, tmp_cte.pizzeria_id;