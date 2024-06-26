WITH md AS (SELECT missing_date::date 
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date),
pv AS (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2)
SELECT missing_date FROM md
LEFT JOIN pv ON md.missing_date = pv.visit_date WHERE pv.visit_date IS NULL
ORDER BY missing_date ASC;