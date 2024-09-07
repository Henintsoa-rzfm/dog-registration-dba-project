-- create_triggers.sql
-- This trigger is used to create increment value for the id_owner 
-- For each row inserted, when id_owner is null we will take the next value generated by the owner_sequence.sql and add it to the id_owner from table owner
### 2. **For Trigger Code (PL/SQL):**
- Use `plsql` as the language identifier.
```markdown
```plsql
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
