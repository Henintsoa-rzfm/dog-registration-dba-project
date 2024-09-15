-- Create breeder table
CREATE TABLE breeder (
    id_breeder INTEGER PRIMARY KEY,
    num_breeder VARCHAR2(50) UNIQUE,
    breeder_name VARCHAR2(50) NOT NULL
);

-- Create owner table
CREATE TABLE owner (
    id_owner VARCHAR2(50) PRIMARY KEY,
    last_name VARCHAR2(50) NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    password VARCHAR2(50) NOT NULL
);

-- Create category table
CREATE TABLE category (
    id_category INTEGER PRIMARY KEY,
    category_name VARCHAR2(50) NOT NULL
);

-- Create category_pedigree table
CREATE TABLE category_pedigree (
    id_cat_ped INTEGER PRIMARY KEY,
    name_categ_pedigree VARCHAR2(50) NOT NULL
);

-- Create breed table
CREATE TABLE breed (
    id_breed VARCHAR2(50) PRIMARY KEY,
    breed_name VARCHAR2(50) NOT NULL,
    id_category INTEGER,
    CONSTRAINT fk_breed_category FOREIGN KEY (id_category)
    REFERENCES category (id_category)
);

-- Create pedigree table
CREATE TABLE pedigree (
    id_ped INTEGER PRIMARY KEY,
    pedigree_num VARCHAR2(50) NOT NULL,
    id_cat_ped INTEGER,
    CONSTRAINT fk_pedigree_category FOREIGN KEY (id_cat_ped)
    REFERENCES category_pedigree (id_cat_ped)
);

-- Create dog table
CREATE TABLE dog (
    id_dog INTEGER PRIMARY KEY,
    numID VARCHAR2(50) UNIQUE,
    dog_name VARCHAR2(50) NOT NULL,
    dog_birth DATE NOT NULL,
    dog_img VARCHAR2(50),
    id_breed VARCHAR2(50),
    id_ped INTEGER,
    id_breeder INTEGER,
    id_owner VARCHAR2(50),
    CONSTRAINT fk_dog_breed FOREIGN KEY (id_breed)
    REFERENCES breed (id_breed),
    CONSTRAINT fk_dog_pedigree FOREIGN KEY (id_ped)
    REFERENCES pedigree (id_ped),
    CONSTRAINT fk_dog_breeder FOREIGN KEY (id_breeder)
    REFERENCES breeder (id_breeder),
    CONSTRAINT fk_dog_owner FOREIGN KEY (id_owner)
    REFERENCES owner (id_owner)
);

-- Create sally table
CREATE TABLE sally (
    id_dog_1 INTEGER,
    id_dog_2 INTEGER,
    sally_num VARCHAR2(50) UNIQUE,
    sally_date DATE,
    id_dog INTEGER,
    CONSTRAINT fk_sally_dog1 FOREIGN KEY (id_dog_1)
    REFERENCES dog (id_dog),
    CONSTRAINT fk_sally_dog2 FOREIGN KEY (id_dog_2)
    REFERENCES dog (id_dog),
    CONSTRAINT fk_sally_dog FOREIGN KEY (id_dog)
    REFERENCES dog (id_dog)
);

INSERT INTO breeder(id_breeder, num_breeder, breeder_name) 
VALUES(1, 'BR123', 'STAFFY-LEGACY KENNEL');

INSERT INTO breeder(id_breeder, num_breeder, breeder_name) 
VALUES(2, 'BR128', 'BULL LEGACY KENNEL');

INSERT INTO breeder(id_breeder, num_breeder, breeder_name) 
VALUES(3, 'BR223', 'APBT LEGACY KENNEL');

INSERT INTO breeder(id_breeder, num_breeder, breeder_name) 
VALUES(4, 'BR431', 'FAUVE KENNEL');

-- Deliting password FROM Owner table 
ALTER TABLE owner DROP COLUMN password;

SELECT * FROM owner;

CREATE SEQUENCE owner_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

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

select * from owner;
-- Inserting data to owner regards the sequence and TRIGGER and the table modification
INSERT INTO owner(last_name, first_name, email) VALUES('PERALTA', 'Jake', 'jake.p@gmail.com');
INSERT INTO owner(last_name, first_name, email) VALUES('NANO', 'Mike', 'n.mikep@gmail.com');
DROP SEQUENCE owner_seq;
SELECT * FROM owner;

CREATE SEQUENCE cat_ped_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

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
--For auto increment
CREATE SEQUENCE dog_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
INSERT INTO category_pedigree(name_categ_pedigree) VALUES('LOF');
SELECT * FROM dog;

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


CREATE SEQUENCE cat_ped
START WITH 1 
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE cat_seq
START WITH 1 
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE TRIGGER insert_category_trigger
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

INSERT INTO category(category_name) VALUES ('Terrier');
INSERT INTO category(category_name) VALUES ('Molosse');
SELECT * FROM category;

ALTER TABLE dog DROP COLUMN id_breed;
ALTER TABLE dog ADD id_breed INTEGER;
ALTER TABLE dog ADD CONSTRAINT fk_breed_dog FOREIGN KEY (id_breed) REFERENCES breed(id_breed);

ALTER TABLE breed DROP PRIMARY KEY;  
ALTER TABLE breed MODIFY id_breed INTEGER;  
ALTER TABLE breed ADD CONSTRAINT breed_pk PRIMARY KEY (id_breed);

CREATE SEQUENCE breed_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

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


INSERT INTO breed(breed_name, id_category) VALUES('American staffordshire', 1);
INSERT INTO breed(breed_name, id_category) VALUES('Rotweiller', 2);

INSERT INTO pedigree(pedigree_num, id_cat_ped) VALUES('BAL_01TH_900', 1);
SELECT * FROM pedigree;

CREATE SEQUENCE ped_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


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

INSERT INTO dog(numid, dog_name, dog_birth, dog_img, id_ped, id_breeder, id_breed, id_owner)
VALUES ('BAL_01TH900', 'BOLT SUNNY DAY', TO_DATE('2022-09-14', 'YYYY-MM-DD'), 'image', 1, 1 , 1, 1) ;
    
SELECT dog.dog_name, owner.first_name ||' ' || owner.last_name AS Owner FROM dog, owner WHERE dog.id_owner = owner.id_owner;
SELECT dog.dog_name, EXTRACT(YEAR FROM dog_birth) AS Naissance FROM DOG WHERE id_dog =1;

ALTER TABLE DOG ADD status VARCHAR2(50);


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

INSERT INTO dog(numid, dog_name, dog_birth, dog_img, id_ped, id_breeder, id_breed, id_owner)
VALUES ('BAL_01HS600', 'VAN PHUN SLK', TO_DATE('2019-09-14', 'YYYY-MM-DD'), 'image2', 1, 1 , 2, 1) ;

INSERT INTO dog(numid, dog_name, dog_birth, dog_img, id_ped, id_breeder, id_breed, id_owner)
VALUES ('B2L_33HS600', 'JUNIOR HAT', TO_DATE('2023-10-24', 'YYYY-MM-DD'), 'image3', 1, 1 , 2, 2) ;


SELECT * FROM Dog;