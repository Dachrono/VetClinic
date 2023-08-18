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
