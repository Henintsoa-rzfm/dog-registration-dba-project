CREATE OR REPLACE TRIGGER trig_before_insert_ped
BEFORE INSERT ON pedigree
FOR EACH ROW
BEGIN
    IF :NEW.id_ped IS NULL THEN
        SELECT ped_seq.NEXTVAL
            INTO :NEW.id_ped
        FROM dual;
    END IF;
END;
/