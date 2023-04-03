/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = 'true' and escape_attepts < 3;