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
