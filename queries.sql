/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE and escape_attepts < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumen', 'Pikachu'); 
SELECT name, escape_attepts from animals WHERE weight_kg > 10.5;
SELECT *  from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 and 17.3;