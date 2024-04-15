WITH combined_data AS (
    SELECT 'visit' AS action_type,
           pizzeria.name,
           COUNT(*) AS count
      FROM person_visits
           JOIN pizzeria ON pizzeria_id = pizzeria.id
     GROUP BY action_type, name
     
     UNION ALL
     
    SELECT 'order' AS action_type,
           pizzeria.name,
           COUNT(*) AS count
      FROM person_order
           JOIN menu ON menu_id = menu.id
           JOIN pizzeria ON pizzeria_id = pizzeria.id
     GROUP BY action_type, name
)

SELECT name,
       SUM(count) AS total_count
  FROM combined_data
 GROUP BY name
 ORDER BY total_count DESC, name ASC;
