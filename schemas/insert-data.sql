-- Inserting data to breeder
INSERT INTO breeder(id_breeder, num_breeder, breeder_name) 
VALUES(1, 'BR123', 'STAFFY-LEGACY KENNEL');

INSERT INTO breeder(id_breeder, num_breeder, breeder_name) 
VALUES(2, 'BR128', 'BULL LEGACY KENNEL');

INSERT INTO breeder(id_breeder, num_breeder, breeder_name) 
VALUES(3, 'BR223', 'APBT LEGACY KENNEL');

INSERT INTO breeder(id_breeder, num_breeder, breeder_name) 
VALUES(4, 'BR431', 'FAUVE KENNEL');

-- Inserting data to owner regards the sequence and TRIGGER and the table modification
INSERT INTO owner(last_name, first_name, email) VALUES('PERALTA', 'Jake', 'jake.p@gmail.com');
INSERT INTO owner(last_name, first_name, email) VALUES('NANO', 'Mike', 'n.mikep@gmail.com');

-- Insert into category_pedigree
INSERT INTO category_pedigree(name_categ_pedigree) VALUES('LOM');
INSERT INTO category_pedigree(name_categ_pedigree) VALUES('LOF');