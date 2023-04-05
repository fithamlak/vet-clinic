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

