/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attepts, neutered, weight_kg)
VALUES ('Agumen', 'Feb 03, 2020', 0, true, 10.23 );

INSERT INTO animals (name, date_of_birth, escape_attepts, neutered, weight_kg)
VALUES ('Gabumon', 'Nov 15, 2018', 2, true, 8 );

INSERT INTO animals (name, date_of_birth, escape_attepts, neutered, weight_kg)
VALUES ('Pikachu', 'Jan 07, 2021', 1, false, 15.04 );

INSERT INTO animals (name, date_of_birth, escape_attepts, neutered, weight_kg)
VALUES ('Devimon', 'May 12, 2017', 5, true, 11 );

INSERT INTO animals (name, date_of_birth, escape_attepts, neutered, weight_kg)
VALUES ('Charmander', 'Feb 08, 2020', 0, false, 11 );

INSERT INTO animals (name, date_of_birth, escape_attepts, neutered, weight_kg)
VALUES ('Plantmon', 'Nov 15, 2021', 2, true, 5.7 );

INSERT INTO animals (name, date_of_birth, escape_attepts, neutered, weight_kg)
VALUES ('Squirtle', 'Apr 02, 1993', 3, false, 12.13 );

INSERT INTO animals (name, date_of_birth, escape_attepts, neutered, weight_kg)
VALUES ('Angemon', 'Jun 12, 2005', 1, true, 45 );

INSERT INTO animals (name, date_of_birth, escape_attepts, neutered, weight_kg)
VALUES ('Boarmon', 'Jun 07, 2005', 7, true, 20.4 );

INSERT INTO animals (name, date_of_birth, escape_attepts, neutered, weight_kg)
VALUES ('Blossom', 'Oct 13, 1998', 3, true, 17 );

INSERT INTO animals (name, date_of_birth, escape_attepts, neutered, weight_kg)
VALUES ('Ditto', 'May 14, 2022', 4, true, 22 );

INSERT INTO owners (full_name, age)
  VALUES ('Sam Smith', 34 ), ('Jennifer Orwell', 19), ('Bob', 45), ('Meldoy Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

   --insert datas into species table
  INSERT INTO species (name)
  VALUES('Pokemon'), ('Digimon');

  UPDATE animals
SET species_id = species.id
FROM species
WHERE animals.name LIKE '%mon'
AND species.name = 'Digimon';

 UPDATE animals
SET species_id = species.id
FROM species
WHERE species_id IS NULL
AND species.name = 'Pokemon';


UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Agumon'
AND owners.full_name = 'Sam Smith';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN('Gabumon', 'Pikachu')
AND owners.full_name = 'Jennifer Orwell';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN('Charmander', 'Squirtle', 'Blossom')
AND owners.full_name = 'Melody Pond';
