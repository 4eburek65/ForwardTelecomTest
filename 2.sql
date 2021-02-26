WITH cte AS (
    SELECT  'A' V_STATUS, 
            'Активен' STATUS_TITLE
    FROM    dual
    UNION ALL
    SELECT  'B', 
            'Заблокирован'
    FROM    dual
    UNION ALL
    SELECT  'С', 
            'Расторгнут'
    FROM    dual
)

SELECT      c.V_STATUS, 
            c.STATUS_TITLE, 
            COUNT(co.ID_CONTRACT_INST) CONTRACTS_QTY
FROM        cte c
            LEFT JOIN CONTRACTS co 
                ON co.V_STATUS = c.V_STATUS
GROUP BY    c.V_STATUS, c.STATUS_TITLE
