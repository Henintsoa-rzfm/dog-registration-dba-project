-- Display the dog name with his Owner
SELECT dog.dog_name, owner.first_name ||' ' || owner.last_name AS Owner FROM dog, owner WHERE dog.id_owner = owner.id_owner;

SELECT dog.dog_name, EXTRACT(YEAR FROM dog_birth) AS Naissance FROM DOG WHERE id_dog =1;