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

select x.name from animals x join owners y on x.owner_id = y.id where y.full_name = 'Melody Pond';

select x.name from animals x join species y on x.species_id = y.id
where y.name = 'Pokemon';

select x.full_name, y.name from owners x left join animals y on x.id = y.owner_id;

select x.name, COUNT(y.id) as total_animals FROM species x left join animals y on x.id = y.species_id
group by x.name;

select x.name from animals x join species y on x.species_id = y.id join owners z on x.owner_id = z.id
where z.full_name = 'Jennifer Orwell' and y.name = 'Digimon';

select x.name from animals x join owners y ON x.owner_id = y.id
where y.full_name = 'Dean Winchester' AND x.escape_attempts = 0;

select x.full_name, COUNT(y.id) as total_animals from owners x left join animals y ON x.id = y.owner_id
group by x.full_name
order by total_animals desc limit 1;

select x.name from animals x 
join visits y on x.id = y.animal_id
join vets z on y.vet_id = z.id
where z.name = 'William Tatcher'
order by y.visit_date desc limit 1;

select COUNT(distinct x.animal_id) as total_animals
from visits x
join vets y on x.vet_id = y.id
where y.name = 'Stephanie Mendez';

select x.name, y.name as specialty
from vets x
left join specializations z on x.id = z.vet_id
left join species y on z.species_id = y.id;

select x.name from animals x
join visits y on x.id = y.animal_id
join vets z on y.vet_id = z.id
where z.name = 'Stephanie Mendez'
and y.visit_date between '2020-04-01' and '2020-08-30';

select x.name
from animals x
join visits y on x.id = y.animal_id
group by x.id
order by COUNT(*) desc limit 1;

select x.name as veterinarian, y.name as patient, z.visit_date
from visits z
join vets x on vet_id = x.id
join animals y on animal_id = y.id
where x.name = 'Maisy Smith'
order by visit_date limit 1;

select x.name as animal_name, y.name as vet_name, z.visit_date
from visits z
join animals x on z.animal_id = x.id
join vets y on z.vet_id = y.id
order by z.visit_date desc limit 1;

select COUNT(*) as num_visits
from visits x
join animals y on x.animal_id = y.id
join vets z on x.vet_id = z.id
left join specializations sp on z.id = sp.vet_id and y.species_id = sp.species_id
where sp.vet_id is null;

select x.name as veterinarian,
COUNT(case when y.name = 'Pokemon' then 1 else null end) as visits_of_Pokemons,
COUNT(case when y.name = 'Digimon' then 1 else null end) as visits_of_Digimons
from visits
join vets x on vet_id = x.id
join animals z on visits.animal_id = z.id
join species y on species_id = y.id
where x.name = 'Maisy Smith'
group by x.name;