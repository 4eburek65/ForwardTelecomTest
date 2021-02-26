WITH cte AS (
    SELECT      ss.ID_SERVICE,
                ROW_NUMBER() OVER(ORDER BY COUNT(*) DESC) ROW_NUM
    FROM        SERVICES ss
    GROUP BY    ss.ID_SERVICE
)

SELECT DISTINCT t.V_NAME
FROM            SERVICES ss
                INNER JOIN cte c
                    ON c.ID_SERVICE = ss.ID_SERVICE
                    AND c.ROW_NUM <= 5
                INNER JOIN TARIFF_PLAN t 
                    ON t.ID_TARIFF_PLAN = ss.ID_TARIFF_PLAN
