-- Creating sequence to make the id_owner as an auto increment, it will be necessary for the owner_trigger
CREATE SEQUENCE owner_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;