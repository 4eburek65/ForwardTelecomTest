WITH cte AS (
    SELECT      b.F_SUM,
                b.DT_EVENT
    FROM        CONTRACTS c
                INNER JOIN BILLS b
                    ON b.ID_CONTRACT_INST = c.ID_CONTRACT_INST
    WHERE       c.V_EXT_IDENT = 'XXX'
    ORDER BY    b.DT_EVENT DESC
)
SELECT  c.F_SUM
FROM    cte c 
WHERE   TRUNC(c.DT_EVENT, 'DDD') <= TRUNC(SYSDATE, 'DDD') 
        AND ROWNUM = 1

