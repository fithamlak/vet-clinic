/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE and escape_attepts < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumen', 'Pikachu'); 
SELECT name, escape_attepts from animals WHERE weight_kg > 10.5;
SELECT *  from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE neutered = TRUE;
SELECT * from animals WHERE weight_kg BETWEEN 10.4 and 17.3;

-- update name of animal from Agumen to Agumon
UPDATE animals
SET name = 'Agumon'
WHERE name = 'Agumen';

--Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. 
--Then roll back the change and verify that the species columns went back to the state before the transaction.
BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';
SELECT * from animals;
ROLLBACK;
SELECT * from animals;

--Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN TRANSACTION;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
-- Commit the transaction.
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL OR species = '';
SELECT * FROM animals;
COMMIT;
-- Verify that change was made and persists after commit.
SELECT * FROM animals;

-- Now, take a deep breath and... Inside a transaction delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
SELECT COUNT(*) FROM ANIMALS;
ROLLBACK;
-- After the rollback verify if all records in the animals table still exists. After that, you can start breathing as usual ;)
SELECT COUNT(*) FROM ANIMALS;

--nside a transaction:
  --Delete all animals born after Jan 1st, 2022.
  --Create a savepoint for the transaction.
  --Update all animals' weight to be their weight multiplied by -1.
  --Rollback to the savepoint
  --Update all animals' weights that are negative to be their weight multiplied by -1.
  --Commit transaction
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

-- How many animals are there?
SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attepts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, SUM(escape_attepts) AS total_escapes
FROM animals
GROUP BY neutered
ORDER BY total_escapes DESC;

-- What is the minimum and maximum weight of each type of animal?
SELECT neutered, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY neutered;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT neutered, AVG(escape_attepts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY neutered;

-- What animals belong to Melody Pond?
SELECT animals .*, full_name
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT , species.name
FROM animals
JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.id, full_name, age, name
FROM owners
LEFT JOIN animals 
   ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species_id, COUNT(*) AS total_numbers
FROM animals
GROUP BY species_id
ORDER BY total_numbers DESC;   

-- List all Digimon owned by Jennifer Orwell.
SELECT animals .*, full_name
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell' and species_id = 2 ;

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals .*, full_name
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' and escape_attepts = 0;

-- Who owns the most animals?
SELECT owner_id, count(*) AS total_numer_of_animals
FROM animals
GROUP BY owner_id
ORDER BY total_numer_of_animals DESC;

-- Who was the last animal seen by William Tatcher?
SELECT vets.name As Vet_name, animals.name As Animals_name, visits.visit_date
FROM visits
JOIN animals
ON visits.animal_id = animals.id
JOIN vets
ON visits.vet_id = vets.id AND vets.name = 'Vet William Tatcher'
ORDER BY visits.visit_date DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(animal_id)
FROM visits
JOIN animals
ON visits.animal_id = animals.id
JOIN vets
ON visits.vet_id = vets.id AND vets.name = 'Vet Stephanie Mendez'

-- List all vets and their specialties, including vets with no specialties
SELECT vets.name AS Vets_name, species.name As Species_name
FROM vets
left Join specializations
on specializations.vet_id = vets.id
left join species
on specializations.species_id = species.id

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name AS animal_name, vets.name As vet_name, visit_date
FROM visits
JOIN animals
ON visits.animal_id = animals.id
JOIN vets
ON visits.vet_id = vets.id AND vets.name = 'Vet Stephanie Mendez' AND
   visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(id)
FROM visits
JOIN animals
ON visits.animal_id = animals.id
GROUP BY animals.name
ORDER BY COUNT(id) DESC
LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT vets.name As vets_name, animals.name As animals_name, visits.visit_date
FROM visits
JOIN animals
ON visits.animal_id = animals.id
JOIN vets
ON visits.vet_id = vets.id AND vets.name = 'Vet Maisy Smith'
ORDER BY visits.visit_date ASC
LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT visits.visit_date, animals.name As animals_name, vets.name As vet_name
FROM visits
JOIN animals
ON visits.animal_id = animals.id
JOIN vets
ON visits.vet_id = vets.id
ORDER BY visits.visit_date DESC
LIMIT 1;

--How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*)
FROM visits
JOIN animals
ON visits.animal_id = animals.id
JOIN species
ON animals.species_id = species.id
JOIN vets
ON visits.vet_id = vets.id
LEFT JOIN specializations
ON specializations.vet_id = vets.id
WHERE specializations.species_id != animals.species_id OR specializations.species_id IS NULL;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(species.name)
FROM visits
JOIN vets
ON visits.vet_id = vets.id AND vets.name = 'Vet Maisy Smith'
JOIN animals
ON visits.animal_id = animals.id
JOIN species
ON animals.species_id = species.id
GROUP BY(species.name)
ORDER BY COUNT(species.name) DESC
LIMIT 1;