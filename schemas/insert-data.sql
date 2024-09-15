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

INSERT INTO category(category_name) VALUES ("Terrier");
INSERT INTO category(category_name) VALUES ('Molosse');
SELECT * FROM category;

INSERT INTO breed(breed_name, id_category) VALUES('American staffordshire', 1);
INSERT INTO breed(breed_name, id_category) VALUES('Rotweiller', 2);
INSERT INTO breed(breed_name, id_category) VALUES('American Pitbull', 1);
INSERT INTO breed(breed_name, id_category) VALUES('Cane corso', 2);

INSERT INTO pedigree(pedigree_num, id_cat_ped) VALUES('BAL_01TH_900', 1);

INSERT INTO dog(numid, dog_name, dog_birth, dog_img, id_ped, id_breeder, id_breed, id_owner)
VALUES ('BAL_01TH900', 'BOLT SUNNY DAY', TO_DATE('2022-09-14', 'YYYY-MM-DD'), 'image', 1, 1 , 1, 1) ;
INSERT INTO dog(numid, dog_name, dog_birth, dog_img, id_ped, id_breeder, id_breed, id_owner)
VALUES ('BAL_01HS600', 'VAN PHUN SLK', TO_DATE('2019-09-14', 'YYYY-MM-DD'), 'image2', 1, 1 , 2, 1) ;
INSERT INTO dog(numid, dog_name, dog_birth, dog_img, id_ped, id_breeder, id_breed, id_owner)
VALUES ('B2L_33HS600', 'JUNIOR HAT', TO_DATE('2023-10-24', 'YYYY-MM-DD'), 'image3', 1, 1 , 2, 2) ;
INSERT INTO dog(numid, dog_name, dog_birth, dog_img, id_ped, id_breeder, id_breed, id_owner)
VALUES ('B2L_3300', 'OR HATO', TO_DATE('2021-04-24', 'YYYY-MM-DD'), 'image5', 1, 1 , 3, 2) ;
INSERT INTO dog(numid, dog_name, dog_birth, dog_img, id_ped, id_breeder, id_breed, id_owner)
VALUES ('B2L_3666600', 'Aura ATO', TO_DATE('2024-04-24', 'YYYY-MM-DD'), 'image3', 1, 1 , 2, 2) ;

