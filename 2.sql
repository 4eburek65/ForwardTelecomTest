WITH cte AS (
    SELECT  'A' V_STATUS, 
            '�������' STATUS_TITLE
    FROM    dual
    UNION ALL
    SELECT  'B', 
            '������������'
    FROM    dual
    UNION ALL
    SELECT  '�', 
            '����������'
    FROM    dual
)

SELECT      c.V_STATUS, 
            c.STATUS_TITLE, 
            COUNT(co.ID_CONTRACT_INST) CONTRACTS_QTY
FROM        cte c
            LEFT JOIN CONTRACTS co 
                ON co.V_STATUS = c.V_STATUS
GROUP BY    c.V_STATUS, c.STATUS_TITLE
