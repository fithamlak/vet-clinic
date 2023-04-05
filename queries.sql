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

ROLLBACK;

BEGIN TRANSACTION;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL OR species = '';

COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

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