CREATE TRIGGER insert_cat_trigger
BEFORE INSERT ON CATEGORY
FOR EACH ROW
BEGIN
IF :NEW.id_category IS NULL THEN
    SELECT cat_seq.NEXTVAL INTO 
        :NEW.id_category
    FROM dual;
END IF;
END;
/