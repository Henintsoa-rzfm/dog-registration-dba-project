--Average age of DOGS BY breed
SELECT 
    b.breed_name, 
    ROUND(AVG(EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM d.dog_birth)), 2) AS avg_age
FROM 
    dog d
JOIN 
    breed b ON d.id_breed = b.id_breed
GROUP BY 
    b.breed_name;

--Number of Dogs Owned by Each Owner
SELECT 
    o.first_name || ' ' || o.last_name AS owner_name, 
    COUNT(d.id_dog) AS num_of_dogs
FROM 
    owner o
JOIN 
    dog d ON o.id_owner = d.id_owner
GROUP BY 
    o.first_name, o.last_name
ORDER BY 
    num_of_dogs DESC;

--Number of dog breed that owner possessed
SELECT 
    owner.first_name || ' ' || owner.last_name AS Owner_name,
    breed.breed_name,
    COUNT(dog.id_dog) AS num_of_dogs
FROM 
    dog
JOIN 
    owner ON owner.id_owner = dog.id_owner
JOIN
    breed ON breed.id_breed = dog.id_breed
GROUP BY 
    owner.first_name, owner.last_name, breed.breed_name
ORDER BY 
    Owner_name;
