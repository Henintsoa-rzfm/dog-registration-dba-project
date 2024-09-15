CREATE OR REPLACE TRIGGER insert_breed_trigger
BEFORE INSERT ON Breed
FOR EACH ROW
BEGIN
    IF :NEW.id_breed IS NULL THEN
        SELECT breed_seq.NEXTVAL
            INTO :NEW.id_breed
        FROM dual;
    END IF;
END;
/
