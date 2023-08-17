/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

begin;
update animals set species = 'unspecified';
select* from animals;
rollback;

begin;
update animals set species = 'Digimon' where name like '%mon';
update animals set species = 'Pokemon' where species is null;
commit;

begin;
delete from animals;
rollback;

begin;
delete from animals where date_of_birth > '2022-01-01';
SAVEPOINT my_savepoint;
update animals set weight_kg = -weight_kg;
ROLLBACK TO my_savepoint;
update animals set weight_kg = -weight_kg where weight_kg < 0;
commit;
