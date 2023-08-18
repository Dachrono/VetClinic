/* Database schema to keep the structure of entire database. */

create table animals (
    id serial primary key,
    name varchar(20),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal,
    species varchar(20)
);

create table owners (
    id serial primary key,
    full_name varchar(50),
    age int
);

create table species (
    id serial primary key,
    name varchar(20)
);

alter table animals drop column species;

alter table animals add column species_id int, add constraint fk_species foreign key (species_id) REFERENCES species(id);

alter table animals add COLUMN owner_id int, add constraint fk_owners foreign key (owner_id) REFERENCES owners(id);
