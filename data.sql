insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values 
('Agumon', '2020-02-03', 0, true, 10.23),
('Gabumon', '2018-11-15', 2, true, 8.0),
('Pikachu', '2021-01-07', 1, false, 15.04),
('Devimon', '2017-05-13', 5, true, 11.0),
('Charmander', '2020-02-08', 0, false, -11.0),
('Plantmon', '2021-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45.0),
('Boarmon', '2005-06-7', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17.0),
('Ditto', '2022-05-14', 4, true, 22.0);

insert into owners (name, age) values 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

insert into species (name) values 
('Digimon'),
('Pokemon');

update animals set species_id = (
    CASE 
        when name like '%mon' then (select id from species where name = 'Digimon')
        else (select id from species where name = 'Pokemon')
    END
);

update animals set owner_id = (select id from owners where full_name = 'Sam Smith')
where name = 'Agumon';

update animals set owner_id = (select id from owners where full_name = 'Jennifer Orwell') 
where name in ('Gabumon', 'Pikachu');

update animals set owner_id = (select id from owners where full_name = 'Bob')
where name in ('Devimon', 'Plantmon');

update animals set owner_id = (select id from owners where full_name = 'Melody Pond')
where name in ('Charmander', 'Squirtle', 'Blossom');

update animals set owner_id = (select id from owners where full_name = 'Dean Winchester')
where name in ('Angemon', 'Boarmon');

insert into vets (name, age, date_of_graduation) values 
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

insert into specializations(vet_id, species_id) values 
(1, 1), 
(3, 1), 
(3, 2), 
(4, 2); 

--Vet William Tatcher is specialized in Pokemon.
--Vet Stephanie Mendez is specialized in Digimon and Pokemon.

--Vet Jack Harkness is specialized in Digimon.

insert into visits values
(1, 1, '2020-05-24'), 
(1, 3, '2020-07-22'), 
(2, 4, '2021-02-02'), 
(3, 2, '2020-01-05'),
(3, 2, '2020-03-08'), 
(3, 2, '2020-05-14'), 
(4, 2, '2021-05-04'), 
(5, 1, '2021-02-24'), 
(6, 2, '2019-12-21'), 
(6, 1, '2020-08-10'), 
(6, 2, '2021-04-07'), 
(7, 3, '2019-09-29'), 
(8, 4, '2020-10-03'), 
(8, 4, '2020-11-04'), 
(9, 2, '2019-01-24'), 
(9, 2, '2019-05-15'), 
(9, 2, '2020-02-27'), 
(9, 2, '2020-08-03'), 
(10, 3, '2020-05-24'), 
(10, 1, '2021-01-11'); 

-- Agumon visited William Tatcher on May 24th, 2020.
-- Agumon visited Stephanie Mendez on Jul 22th, 2020.
-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
-- Pikachu visited Maisy Smith on Jan 5th, 2020.
-- Pikachu visited Maisy Smith on Mar 8th, 2020.
-- Pikachu visited Maisy Smith on May 14th, 2020.
-- Devimon visited Stephanie Mendez on May 4th, 2021.
-- Charmander visited Jack Harkness on Feb 24th, 2021.
-- Plantmon visited Maisy Smith on Dec 21st, 2019.
-- Plantmon visited William Tatcher on Aug 10th, 2020.
-- Plantmon visited Maisy Smith on Apr 7th, 2021.
-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
-- Angemon visited Jack Harkness on Oct 3rd, 2020.
-- Angemon visited Jack Harkness on Nov 4th, 2020.
-- Boarmon visited Maisy Smith on Jan 24th, 2019.
-- Boarmon visited Maisy Smith on May 15th, 2019.
-- Boarmon visited Maisy Smith on Feb 27th, 2020.
-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
-- Blossom visited Stephanie Mendez on May 24th, 2020.
-- Blossom visited William Tatcher on Jan 11th, 2021.