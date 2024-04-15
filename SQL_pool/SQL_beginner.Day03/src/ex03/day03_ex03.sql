SELECT pizzeria_name
FROM (
    SELECT pizzeria_name,
           SUM(CASE WHEN gender = 'female' THEN visit_count ELSE 0 END) AS female_visits,
           SUM(CASE WHEN gender = 'male' THEN visit_count ELSE 0 END) AS male_visits
    FROM (
        SELECT COUNT(*) AS visit_count, pizzeria.name AS pizzeria_name, person.gender
        FROM person
        JOIN person_visits ON person.id = person_visits.person_id
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
        WHERE person.gender IN ('female', 'male')
        GROUP BY pizzeria_name, person.gender
    ) AS gender_visits
    GROUP BY pizzeria_name
) AS aggregated_visits
WHERE female_visits > male_visits OR male_visits > female_visits
ORDER BY pizzeria_name;