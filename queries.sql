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
select * from animals;
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
SAVEPOINT checkpoint;
update animals set weight_kg = -weight_kg;
ROLLBACK TO checkpoint;
update animals set weight_kg = -weight_kg where weight_kg < 0;
commit;

select COUNT(*) from animals;
select COUNT(*) from animals where escape_attempts = 0;
select AVG(weight_kg) from animals;
select neutered, SUM(escape_attempts) as total_escape_attempts from animals group by neutered;
select species, MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight FROM animals GROUP BY species;
select species, AVG(escape_attempts) as avg_escape_attempts from animals where EXTRACT(year from date_of_birth) between 1990 and 2000 group by species;
