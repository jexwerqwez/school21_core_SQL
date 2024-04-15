SELECT order_date, CONCAT(name, ' (age:', age, ')') AS person_information FROM
(SELECT person_id, order_date FROM person_order) AS fp
NATURAL JOIN (SELECT id AS person_id, name, age FROM person) AS sp
ORDER BY order_date, person_information;