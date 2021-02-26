DECLARE 
    CURSOR CUR IS
        SELECT  ss.DT_STOP
        FROM    SERVICES ss
        WHERE   ss.ID_SERVICE != 1234
                AND ss.ID_TARIFF_PLAN = 567
        FOR UPDATE NOWAIT;
BEGIN
    FOR i IN CUR
    LOOP
        UPDATE  SERVICES ss
        SET     ss.DT_STOP = SYSDATE
        WHERE   CURRENT OF CUR;
    END LOOP;
END;
