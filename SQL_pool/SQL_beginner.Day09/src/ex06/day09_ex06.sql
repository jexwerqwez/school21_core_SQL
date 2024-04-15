DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date(varchar, numeric, date);

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson varchar DEFAULT 'Dmitriy',
    IN pprice numeric DEFAULT 500,
    IN pdate date DEFAULT '2022-01-08')
RETURNS TABLE (
    pizzeria_name varchar
) AS $$
BEGIN
    RETURN QUERY
    SELECT DISTINCT pizzeria.name AS pizzeria_name
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person_order ON person_visits.person_id = person_order.person_id
    JOIN menu ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_visits.person_id
    WHERE person.name = pperson AND person_visits.visit_date = pdate AND menu.price < pprice;
END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');