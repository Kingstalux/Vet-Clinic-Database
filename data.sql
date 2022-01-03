/* Populate database with sample data. */

INSERT INTO animals
VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23),
(2, 'Gabumon', '2018-11-15', 2, true, 8),
(3, 'Pikachu', '2021-01-07', 1, false, 15.04),
(4, 'Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES (5, 'Charmander', '2020-02-08', 0, false,  -11),
(6, 'Plantmon', '2022-11-15', 2, true,  -5.7),
(7, 'Squirtle', '1993-04-02', 3, false,  -12.13),
(8, 'Angemon', '2005-06-12', 1, true,  -45),
(9, 'Boarmon', '2005-06-07', 7, true,  20.4),
(10, 'Blossom', '1998-10-13', 3, true,  17);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon'),
('Digimon');

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon%';

UPDATE animals
SET species_id = 1
WHERE name NOT LIKE '%mon%';

UPDATE animals
SET owners_id = 1
WHERE name = 'Agumon';
UPDATE animals
SET owners_id = 2
WHERE name = 'Gabumon' or name = 'Pikachu';
UPDATE animals
SET owners_id = 3
WHERE name = 'Devimon' or name = 'Plantmon';
UPDATE animals
SET owners_id = 4
WHERE name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';
UPDATE animals
SET owners_id = 5 
WHERE name = 'Angemon' or name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(vet_id, species_id)
VALUES (1, 1),
(3, 1),
(3, 2),
(4, 2),
(2, null);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owners_id) 
VALUES('Plantmon', '2022-11-15', 2, true,  -5.7, 2, 3);

INSERT INTO visits
VALUES (1, 1, '2020-05-24'),
(3, 1, '2020-07-22'),  
(4, 2, '2021-02-02'),
(2, 3, '2020-01-05'),
(2, 3, '2020-03-08'),
(2, 3, '2020-05-14'),
(3, 4, '2021-05-04'),
(4, 5, '2021-02-24'),
(2, 10, '2019-12-21'),
(1, 10, '2020-08-10'),
(2, 10, '2021-04-07'),
(3, 6, '2019-09-29'),
(4, 8, '2020-10-03'),
(4, 8, '2020-11-04'),
(2, 9, '2019-01-24'),
(2, 9, '2019-05-15'),
(2, 9, '2020-02-27'),
(2, 9, '2020-08-03'),
(3, 7, '2020-05-24'),
(1, 7, '2021-01-11');

INSERT INTO visits (animal_id, vet_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';