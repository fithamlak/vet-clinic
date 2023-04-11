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

-- Modify your inserted animals so it includes the species_id value:
  -- If the name ends in "mon" it will be Digimon  
UPDATE animals
SET species_id = species.id
FROM species
WHERE animals.name LIKE '%mon'
AND species.name = 'Digimon';

-- All other animals are Pokemon
UPDATE animals
SET species_id = species.id
FROM species
WHERE species_id IS NULL
AND species.name = 'Pokemon';

-- Modify your inserted animals to include owner information (owner_id
-- Sam Smith owns Agumon.
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Agumon'
AND owners.full_name = 'Sam Smith';

-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN('Gabumon', 'Pikachu')
AND owners.full_name = 'Jennifer Orwell';

-- Bob owns Devimon and Plantmon.
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN('Devimon', 'Plantmon')
AND owners.full_name = 'Bob';

--Melody Pond owns Charmander, Squirtle, and Blossom
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN('Charmander', 'Squirtle', 'Blossom')
AND owners.full_name = 'Melody Pond';

-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN('Angemon', 'Boarmon')
AND owners.full_name = 'Dean Winchester';


-- insert four vets into vets table 
INSERT INTO vets (name, age, date_of_graduation)
  VALUES ('Vet William Tatcher', 45, 'Apr 23 2000' ), ('Vet Maisy Smith', 26, 'Jan 17 2019'), ('Vet Stephanie Mendez', 64, 'May 04 1981'), ('Vet Jack Harkness', 38, 'Jun 08 2008');


-- insert the given data into specializations table
INSERT INTO specializations (vet_id, species_id)
 VALUES (1, 1), (3, 2), (3, 1), (4, 2);
 
-- Insert the following data for visits:
  -- Agumon visited William Tatcher on May 24th, 2020.
  -- Agumon visited Stephanie Mendez on Jul 22th, 2020.
  -- ....
  -- ...
  -- ... etc
 INSERT INTO visits (animal_id, vet_id, visit_date)
  VALUES (1, 1, 'May 24 2020'), (1, 3, 'Jul 22 2020'), (2, 4, 'Feb 02 2021'),
         (3, 2, 'Jan 05 2020'), (3, 2, 'Mar 08 2020'), (3, 2, 'May 14 2021'),
         (4, 3, 'May 04 2021'), (5, 4, 'Feb 24 2021'), (6, 2, 'Dec 21 2019'),
         (6, 1, 'Aug 10 2020'), (6, 2, 'Apr 07 2021'), (7, 3, 'Sep 29 2019'),
         (1, 4, 'Oct 03 2020'), (1, 4, 'Nov 04 2020'), (9, 2, 'Jan 24 2019'),
         (9, 2, 'May 15 2019'), (9, 2, 'Feb 27 2020'), (9, 2, 'Aug 03 2019'),
         (10, 3, 'May 24 2020'), (10, 1, 'Jan 11 2021');


         
-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';