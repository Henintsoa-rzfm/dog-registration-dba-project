--Updating the status column for Dog table
UPDATE dog
SET status = CASE 
                WHEN EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM dog_birth) >= 5 THEN 'Retraité'
                ELSE 'Actif'
             END
WHERE status IS NULL;
