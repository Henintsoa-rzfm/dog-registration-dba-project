-- create_triggers.sql
CREATE OR REPLACE TRIGGER trg_before_insert_owner
BEFORE INSERT ON owner
FOR EACH ROW
BEGIN
    IF :NEW.id_owner IS NULL THEN
        SELECT owner_seq.NEXTVAL
        INTO :NEW.id_owner
        FROM dual;
    END IF;
END;
/
