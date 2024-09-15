-- Deleting password FROM Owner table 
ALTER TABLE owner DROP COLUMN password;

--Modify the type of id_breed FROM the Breed TABLE
--Drop first the foreign key before dropping primary key constraint in order to modify the varchar to integer
ALTER TABLE dog DROP COLUMN id_breed;
ALTER TABLE breed DROP PRIMARY KEY;  
-- Change the type to integer
ALTER TABLE dog ADD id_breed INTEGER;
--add the PRIMARY KEY constraint
ALTER TABLE breed ADD CONSTRAINT breed_pk PRIMARY KEY (id_breed);
-- Re adding the FK we drop on the table dog
ALTER TABLE dog ADD CONSTRAINT fk_breed_dog FOREIGN KEY (id_breed) REFERENCES breed(id_breed);


