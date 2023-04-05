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