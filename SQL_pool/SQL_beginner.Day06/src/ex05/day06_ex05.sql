COMMENT ON TABLE person_discounts IS 'Таблица персональных скидок';
COMMENT ON COLUMN person_discounts.id IS 'Первичный ключ';
COMMENT ON COLUMN person_discounts.person_id IS 'Внешний ключ идентификатора клиента person_id';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Внешний ключ идентификатора пиццерии pizzeria_id';
COMMENT ON COLUMN person_discounts.discount IS 'Значение скидки в процентах';