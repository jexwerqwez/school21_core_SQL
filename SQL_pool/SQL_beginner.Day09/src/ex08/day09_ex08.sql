DROP FUNCTION IF EXISTS fnc_fibonacci(integer);

CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE (fibonacci_number bigint) AS $$
BEGIN
    RETURN QUERY
    WITH RECURSIVE fibonacci_cte(a, b) AS (
        SELECT 0::bigint, 1::bigint
        UNION ALL
        SELECT b, a + b
        FROM fibonacci_cte
        WHERE a + b < pstop
    )
    SELECT a FROM fibonacci_cte;
END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();