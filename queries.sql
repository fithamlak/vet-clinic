/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE and escape_attepts < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumen', 'Pikachu'); 
SELECT name, escape_attepts from animals WHERE weight_kg > 10.5;
SELECT *  from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE neutered = TRUE;
SELECT * from animals WHERE weight_kg BETWEEN 10.4 and 17.3;
UPDATE animals
SET name = 'Agumon'
WHERE name = 'Agumen';

BEGIN TRANSACTION;

UPDATE animals
SET species = 'unspecified';
SELECT * from animals;
ROLLBACK;
SELECT * from animals;

BEGIN TRANSACTION;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL OR species = '';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT COUNT(*) FROM ANIMALS;
ROLLBACK;
SELECT COUNT(*) FROM ANIMALS;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT negative_weight;
UPDATE animals
SET weight_kg = -1 * weight_kg;
ROLLBACK TO negative_weight;
UPDATE animals
SET weight_kg = -1 * weight_kg
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attepts = 0;
SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attepts) AS total_escapes
FROM animals
GROUP BY neutered
ORDER BY total_escapes DESC;

SELECT neutered, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY neutered;

SELECT neutered, AVG(escape_attepts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY neutered;

SELECT animals .*, full_name
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT , species.name
FROM animals
JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.id, full_name, age, name
FROM owners
LEFT JOIN animals 
   ON owners.id = animals.owner_id;

SELECT species_id, COUNT(*) AS total_numbers
FROM animals
GROUP BY species_id
ORDER BY total_numbers DESC;   

SELECT animals .*, full_name
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell' and species_id = 2 ;


SELECT animals .*, full_name
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' and escape_attepts = 0;

SELECT owner_id, count(*) AS total_numer_of_animals
FROM animals
GROUP BY owner_id
ORDER BY total_numer_of_animals DESC;
