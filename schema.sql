/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
	id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(40),
    date_of_birth date,
	escape_attepts int,
	neutered boolean,
	weight_kg decimal
);

ALTER TABLE animals 
ADD COLUMN species varchar(50);

CREATE TABLE owners(
	id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar(40),
    age int,
	PRIMARY KEY (id)
);

CREATE TABLE species(
	id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(40),
	PRIMARY KEY (id)
);

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