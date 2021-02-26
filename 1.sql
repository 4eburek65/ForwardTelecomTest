WITH cte (days) AS (
    SELECT  CAST(TRUNC(SYSDATE , 'DDD') AS DATE) days
    FROM    dual
    UNION ALL
    SELECT  CAST(c.days - 1 AS DATE)
    FROM    cte c
    WHERE   c.days - 1 > SYSDATE - 5
)

SELECT      c.days,
            COUNT(co.ID_CONTRACT_INST) count
FROM        cte c
            LEFT JOIN CONTRACTS co
                ON CAST(TRUNC(co.DT_REG, 'DDD') AS DATE) = c.days
GROUP BY    c.days

