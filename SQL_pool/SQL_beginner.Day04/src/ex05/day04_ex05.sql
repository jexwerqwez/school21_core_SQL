CREATE VIEW v_price_with_discount AS (
SELECT name, pizza_name, price, (price - price*0.1) AS discount_price
FROM person
JOIN person_order ON person.id = person_id
JOIN menu ON menu.id = menu_id
ORDER BY name, pizza_name);