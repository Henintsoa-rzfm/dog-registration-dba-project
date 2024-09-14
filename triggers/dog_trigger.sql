CREATE OR REPLACE TRIGGER trig_before_insert_dog
BEFORE INSERT ON dog
FOR EACH ROW
BEGIN
    IF :NEW.id_dog IS NULL THEN
        SELECT dog_seq.NEXTVAL
            INTO :NEW.id_dog
        FROM dual;
    END IF;
END;
/