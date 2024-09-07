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
