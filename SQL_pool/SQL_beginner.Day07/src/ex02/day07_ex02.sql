SELECT name, count, action_type
FROM (
    SELECT 'visit' AS action_type,
           pizzeria.name,
           COUNT(*) AS count
      FROM person_visits
           JOIN pizzeria ON pizzeria_id = pizzeria.id
     GROUP BY action_type, name
     ORDER BY count DESC
     LIMIT 3
) AS visit_counts

UNION ALL

SELECT name, count, action_type
FROM (
    SELECT 'order' AS action_type,
           pizzeria.name,
           COUNT(*) AS count
      FROM person_order
           JOIN menu ON menu_id = menu.id
           JOIN pizzeria ON pizzeria_id = pizzeria.id
     GROUP BY action_type, name
     ORDER BY count DESC
     LIMIT 3
) AS order_counts

ORDER BY action_type ASC, count DESC;
