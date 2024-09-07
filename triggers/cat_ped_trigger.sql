CREATE OR REPLACE TRIGGER trig_before_insert_cat_ped
BEFORE INSERT ON category_pedigree
FOR EACH ROW
BEGIN
    IF :NEW.id_cat_ped IS NULL THEN
        SELECT cat_ped_seq.NEXTVAL
            INTO :NEW.id_cat_ped
        FROM dual;
    END IF;
END;
/