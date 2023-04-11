/* Database schema to keep the structure of entire database. */
-- create animals database
CREATE TABLE animals(
	id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(40),
    date_of_birth date,
	escape_attepts int,
	neutered boolean,
	weight_kg decimal
);

-- add column "species" into animals table
ALTER TABLE animals 
ADD COLUMN species varchar(50);

-- Create a table named owners with the following columns
CREATE TABLE owners(
	id INT GENERATED ALWAYS AS IDENTITY,
  full_name varchar(40),
  age int,
	PRIMARY KEY (id)
);

-- Create a table named species with the following columns:
CREATE TABLE species(
	id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(40),
	PRIMARY KEY (id)
);


--Modify animals table:
  --Make sure that id is set as autoincremented PRIMARY KEY
  --Remove column species
  --Add column species_id which is a foreign key referencing species table
  --Add column owner_id which is a foreign key referencing the owners table

-- make id as primary key of animals
ALTER TABLE animals ADD PRIMARY KEY (id);

-- Remove the "species" column from the table
ALTER TABLE animals DROP COLUMN species;

-- First, add the new column to the animals table
ALTER TABLE animals ADD COLUMN species_id INTEGER;

-- Next, create the foreign key constraint
ALTER TABLE animals ADD CONSTRAINT fk_animals_species
  FOREIGN KEY (species_id)
  REFERENCES species (id);

    -- First, add the new column to the animals table
ALTER TABLE animals ADD COLUMN owners_id INTEGER;

-- Next, create the foreign key constraint
ALTER TABLE animals ADD CONSTRAINT fk_animals_owners
  FOREIGN KEY (owners_id)
  REFERENCES owners (id);

--change owners_id column name into owner_id whichis the given name
  ALTER TABLE animals RENAME COLUMN owners_id TO owner_id;

-- create vets table based on the given columns
  CREATE TABLE vets(
	  id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(40),
    age int,
	  date_of_graduation date,
	  PRIMARY KEY (id)
);

-- Create a "join table" called specializations to handle many-to-many relationship bitween species and vets tables.
CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets(id),
  species_id INTEGER REFERENCES species(id),
  PRIMARY KEY (vet_id, species_id)
);

-- Create a "join table" called visites to handle many-to-many relationship bitween animals and vets tables,it should also keep track of the date of the visit
CREATE TABLE visits (
    animal_id INTEGER REFERENCES animals(id),
	vet_id INTEGER REFERENCES vets(id),
	visit_date DATE,
    PRIMARY KEY (vet_id, animal_id)
);

-- add visit_date column from primary key
ALTER TABLE visits
DROP CONSTRAINT visits_pkey,
ADD PRIMARY KEY (vet_id, animal_id, visit_date );

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


ALTER TABLE visits ADD COLUMN id INT GENERATED ALWAYS AS IDENTITY;
ALTER TABLE visits
DROP CONSTRAINT visits_pkey,
ADD PRIMARY KEY (id);