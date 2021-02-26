SELECT      d.V_NAME
FROM        DEPARTMENTS d
            LEFT JOIN CONTRACTS c
                ON c.ID_DEPARTMENT = d.ID_DEPARTMENT
                AND c.V_STATUS = 'A'
GROUP BY    d.ID_DEPARTMENT,
            d.V_NAME
HAVING      COUNT(c.ID_CONTRACT_INST) = 0
