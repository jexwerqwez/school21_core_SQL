CREATE INDEX idx_person_name ON person USING BTREE (UPPER(name));

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT * FROM person WHERE UPPER(name) = 'PETER';