SELECT 
    address,
    ROUND((MAX(age) - MIN(age)::FLOAT4 / MAX(age))::NUMERIC, 2),
    ROUND(AVG(age), 2) AS average,
    CASE WHEN (MAX(age) - (MIN(age) / NULLIF(MAX(age), 0))) > AVG(age) THEN TRUE ELSE FALSE END AS comparison_result
FROM 
    person
GROUP BY 
    address
ORDER BY 
    address;
