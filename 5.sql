CREATE OR REPLACE PROCEDURE get_service_by_id (
    dwr OUT SYS_REFCURSOR, 
    pID IN SERVICE.ID_SERVICE%TYPE DEFAULT NULL
) 
AS
BEGIN
    OPEN dwr FOR
        SELECT      s.ID_SERVICE,
                    s.V_NAME, 
                    COUNT(ss.ID_SERVICE_INST) CNT
        FROM        SERVICE s
                    LEFT JOIN SERVICES ss 
                        ON s.ID_SERVICE = ss.ID_SERVICE
        WHERE       s.ID_SERVICE = NVL(pID, s.ID_SERVICE)
        GROUP BY    s.ID_SERVICE,
                    s.V_NAME
        ORDER BY    s.V_NAME;
END get_service_by_id;
