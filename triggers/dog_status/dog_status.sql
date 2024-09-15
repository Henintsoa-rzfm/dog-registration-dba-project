CREATE OR REPLACE TRIGGER dog_status
BEFORE INSERT ON Dog
FOR EACH ROW
DECLARE
    var_birth_year INTEGER;
    var_actual_year INTEGER;
BEGIN
    -- Get the current year
    SELECT EXTRACT(YEAR FROM SYSDATE) 
    INTO var_actual_year 
    FROM DUAL;
    
    -- Get the dog's birth year from the :NEW value
    var_birth_year := EXTRACT(YEAR FROM :NEW.dog_birth);
    
    -- Set the dog status based on the age
    IF var_actual_year - var_birth_year >= 5 THEN
        :NEW.status := 'Retraité';
    ELSE
        :NEW.status := 'Actif';
    END IF;
END;
/
