/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals
WHERE name LIKE '%mon%';

SELECT name FROM animals
WHERE date_of_birth >= '2016-01-01' and date_of_birth <= '2019-01-01';

SELECT name FROM animals
WHERE neutered = true and escape_attempts < 3;

SELECT date_of_birth FROM animals
WHERE name = 'Agumon' or name = 'Pikachu';

SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;

SELECT * FROM animals
WHERE neutered = true;

SELECT * FROM animals
WHERE name NOT LIKE 'Gabumon';

SELECT * FROM animals
WHERE weight_kg >= 10.4 and weight_kg <= 17.3;


BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';
UPDATE animals
SET species = 'pokemon'
WHERE name NOT LIKE '%mon%';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals 
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(name) FROM animals;

SELECT COUNT(name) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) FROM animals
GROUP BY neutered;

SELECT neutered, MIN(weight_kg) FROM animals
GROUP BY neutered;

SELECT neutered, MAX(weight_kg) FROM animals
GROUP BY neutered;

SELECT neutered, AVG(escape_attempts) FROM animals
WHERE date_of_birth >= '1990-01-01' and date_of_birth <= '2000-01-01'
GROUP BY neutered;

SELECT  *
FROM animals
INNER JOIN owners
ON animals.owners_id = owners.id
WHERE owners.id = 4;

SELECT  *
FROM animals
INNER JOIN species
ON animals.species_id = species.id
WHERE species.id = 1;

SELECT  *
FROM owners
INNER JOIN animals
ON owners.id = animals.owners_id;

SELECT species_id, COUNT(name) FROM animals
GROUP BY species_id;

SELECT * FROM animals
WHERE species_id = 2 and owners_id = 2;

SELECT * FROM animals
WHERE escape_attempts = 0 and owners_id = 5;

SELECT owners_id, COUNT(name) FROM animals
GROUP BY owners_id;

SELECT name
FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
WHERE vet_id = 1 
and visit_date = (
	SELECT MAX(visit_date) FROM visits
	WHERE vet_id = 1
);

SELECT COUNT(animal_id) FROM visits
WHERE vet_id = 3;

SELECT name, species_id
FROM vets
INNER JOIN specializations
ON vets.id = specializations.vet_id;

SELECT name()
FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
WHERE vet_id = 3 and visit_date >= '2020-04-01'
and visit_date <= '2020-07-30';

SELECT name, COUNT(animal_id)
FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
GROUP BY name;

SELECT name
FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
WHERE vet_id = 2 
and visit_date = (
	SELECT MIN(visit_date) FROM visits
	WHERE vet_id = 2
);

SELECT *
FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
WHERE visit_date = (
	SELECT MAX(visit_date) FROM visits
);

SELECT name, COUNT(animal_id)
FROM visits
INNER JOIN vets
ON visits.vet_id = vets.id
GROUP BY name;

SELECT species_id, COUNT(name)
FROM animals
INNER JOIN visits
ON animals.id = visits.animal_id
WHERE vet_id = 2
GROUP BY species_id;