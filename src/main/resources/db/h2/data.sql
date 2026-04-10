INSERT INTO vets VALUES (default, 'James', 'Carter');
INSERT INTO vets VALUES (default, 'Helen', 'Leary');
INSERT INTO vets VALUES (default, 'Linda', 'Douglas');
INSERT INTO vets VALUES (default, 'Rafael', 'Ortega');
INSERT INTO vets VALUES (default, 'Henry', 'Stevens');
INSERT INTO vets VALUES (default, 'Sharon', 'Jenkins');

INSERT INTO specialties VALUES (default, 'radiology');
INSERT INTO specialties VALUES (default, 'surgery');
INSERT INTO specialties VALUES (default, 'dentistry');

INSERT INTO vet_specialties VALUES (2, 1);
INSERT INTO vet_specialties VALUES (3, 2);
INSERT INTO vet_specialties VALUES (3, 3);
INSERT INTO vet_specialties VALUES (4, 2);
INSERT INTO vet_specialties VALUES (5, 1);

INSERT INTO types VALUES (default, 'cat');
INSERT INTO types VALUES (default, 'dog');
INSERT INTO types VALUES (default, 'lizard');
INSERT INTO types VALUES (default, 'snake');
INSERT INTO types VALUES (default, 'bird');
INSERT INTO types VALUES (default, 'hamster');

INSERT INTO owners VALUES (default, 'George', 'Franklin', '110 W. Liberty St.', 'Madison', '6085551023');
INSERT INTO owners VALUES (default, 'Betty', 'Davis', '638 Cardinal Ave.', 'Sun Prairie', '6085551749');
INSERT INTO owners VALUES (default, 'Eduardo', 'Rodriquez', '2693 Commerce St.', 'McFarland', '6085558763');
INSERT INTO owners VALUES (default, 'Harold', 'Davis', '563 Friendly St.', 'Windsor', '6085553198');
INSERT INTO owners VALUES (default, 'Peter', 'McTavish', '2387 S. Fair Way', 'Madison', '6085552765');
INSERT INTO owners VALUES (default, 'Jean', 'Coleman', '105 N. Lake St.', 'Monona', '6085552654');
INSERT INTO owners VALUES (default, 'Jeff', 'Black', '1450 Oak Blvd.', 'Monona', '6085555387');
INSERT INTO owners VALUES (default, 'Maria', 'Escobito', '345 Maple St.', 'Madison', '6085557683');
INSERT INTO owners VALUES (default, 'David', 'Schroeder', '2749 Blackhawk Trail', 'Madison', '6085559435');
INSERT INTO owners VALUES (default, 'Carlos', 'Estaban', '2335 Independence La.', 'Waunakee', '6085555487');

INSERT INTO pets VALUES (default, 'Leo', '2010-09-07', 1, 1);
INSERT INTO pets VALUES (default, 'Basil', '2012-08-06', 6, 2);
INSERT INTO pets VALUES (default, 'Rosy', '2011-04-17', 2, 3);
INSERT INTO pets VALUES (default, 'Jewel', '2010-03-07', 2, 3);
INSERT INTO pets VALUES (default, 'Iggy', '2010-11-30', 3, 4);
INSERT INTO pets VALUES (default, 'George', '2010-01-20', 4, 5);
INSERT INTO pets VALUES (default, 'Samantha', '2012-09-04', 1, 6);
INSERT INTO pets VALUES (default, 'Max', '2012-09-04', 1, 6);
INSERT INTO pets VALUES (default, 'Lucky', '2011-08-06', 5, 7);
INSERT INTO pets VALUES (default, 'Mulligan', '2007-02-24', 2, 8);
INSERT INTO pets VALUES (default, 'Freddy', '2010-03-09', 5, 9);
INSERT INTO pets VALUES (default, 'Lucky', '2010-06-24', 2, 10);
INSERT INTO pets VALUES (default, 'Sly', '2012-06-08', 1, 10);

INSERT INTO visits VALUES (default, 7, '2013-01-01', 'rabies shot');
INSERT INTO visits VALUES (default, 8, '2013-01-02', 'rabies shot');
INSERT INTO visits VALUES (default, 8, '2013-01-03', 'neutered');
INSERT INTO visits VALUES (default, 7, '2013-01-04', 'spayed');

-- 2026 visit data for chart visualization
-- January 2026 (12 visits)
INSERT INTO visits VALUES (default, 1, '2026-01-05', 'checkup');
INSERT INTO visits VALUES (default, 2, '2026-01-07', 'vaccination');
INSERT INTO visits VALUES (default, 3, '2026-01-12', 'dental cleaning');
INSERT INTO visits VALUES (default, 4, '2026-01-15', 'checkup');
INSERT INTO visits VALUES (default, 5, '2026-01-18', 'surgery follow-up');
INSERT INTO visits VALUES (default, 6, '2026-01-20', 'vaccination');
INSERT INTO visits VALUES (default, 7, '2026-01-22', 'checkup');
INSERT INTO visits VALUES (default, 8, '2026-01-25', 'wound care');
INSERT INTO visits VALUES (default, 9, '2026-01-26', 'checkup');
INSERT INTO visits VALUES (default, 10, '2026-01-28', 'vaccination');
INSERT INTO visits VALUES (default, 11, '2026-01-29', 'checkup');
INSERT INTO visits VALUES (default, 12, '2026-01-31', 'checkup');

-- February 2026 (8 visits)
INSERT INTO visits VALUES (default, 1, '2026-02-03', 'checkup');
INSERT INTO visits VALUES (default, 2, '2026-02-05', 'vaccination');
INSERT INTO visits VALUES (default, 3, '2026-02-10', 'surgery');
INSERT INTO visits VALUES (default, 4, '2026-02-14', 'checkup');
INSERT INTO visits VALUES (default, 5, '2026-02-18', 'vaccination');
INSERT INTO visits VALUES (default, 6, '2026-02-20', 'checkup');
INSERT INTO visits VALUES (default, 7, '2026-02-24', 'dental care');
INSERT INTO visits VALUES (default, 8, '2026-02-27', 'checkup');

-- March 2026 (15 visits - busier month)
INSERT INTO visits VALUES (default, 1, '2026-03-02', 'checkup');
INSERT INTO visits VALUES (default, 2, '2026-03-04', 'vaccination');
INSERT INTO visits VALUES (default, 3, '2026-03-07', 'checkup');
INSERT INTO visits VALUES (default, 4, '2026-03-09', 'surgery follow-up');
INSERT INTO visits VALUES (default, 5, '2026-03-11', 'vaccination');
INSERT INTO visits VALUES (default, 6, '2026-03-13', 'dental cleaning');
INSERT INTO visits VALUES (default, 7, '2026-03-15', 'checkup');
INSERT INTO visits VALUES (default, 8, '2026-03-17', 'wound care');
INSERT INTO visits VALUES (default, 9, '2026-03-19', 'checkup');
INSERT INTO visits VALUES (default, 10, '2026-03-21', 'vaccination');
INSERT INTO visits VALUES (default, 11, '2026-03-23', 'checkup');
INSERT INTO visits VALUES (default, 12, '2026-03-25', 'surgery consultation');
INSERT INTO visits VALUES (default, 1, '2026-03-27', 'checkup');
INSERT INTO visits VALUES (default, 2, '2026-03-28', 'vaccination');
INSERT INTO visits VALUES (default, 3, '2026-03-30', 'checkup');

-- April 2026 (10 visits)
INSERT INTO visits VALUES (default, 1, '2026-04-02', 'checkup');
INSERT INTO visits VALUES (default, 2, '2026-04-05', 'vaccination');
INSERT INTO visits VALUES (default, 3, '2026-04-08', 'checkup');
INSERT INTO visits VALUES (default, 4, '2026-04-10', 'dental care');
INSERT INTO visits VALUES (default, 5, '2026-04-12', 'vaccination');
INSERT INTO visits VALUES (default, 6, '2026-04-15', 'checkup');
INSERT INTO visits VALUES (default, 7, '2026-04-18', 'surgery follow-up');
INSERT INTO visits VALUES (default, 8, '2026-04-20', 'checkup');
INSERT INTO visits VALUES (default, 9, '2026-04-22', 'vaccination');
INSERT INTO visits VALUES (default, 10, '2026-04-25', 'checkup');

-- May 2026 (9 visits)
INSERT INTO visits VALUES (default, 1, '2026-05-01', 'checkup');
INSERT INTO visits VALUES (default, 2, '2026-05-03', 'vaccination');
INSERT INTO visits VALUES (default, 3, '2026-05-06', 'checkup');
INSERT INTO visits VALUES (default, 4, '2026-05-09', 'dental cleaning');
INSERT INTO visits VALUES (default, 5, '2026-05-12', 'checkup');
INSERT INTO visits VALUES (default, 6, '2026-05-15', 'vaccination');
INSERT INTO visits VALUES (default, 7, '2026-05-18', 'checkup');
INSERT INTO visits VALUES (default, 8, '2026-05-22', 'surgery consultation');
INSERT INTO visits VALUES (default, 9, '2026-05-28', 'checkup');

-- June 2026 (11 visits)
INSERT INTO visits VALUES (default, 1, '2026-06-02', 'checkup');
INSERT INTO visits VALUES (default, 2, '2026-06-05', 'vaccination');
INSERT INTO visits VALUES (default, 3, '2026-06-08', 'checkup');
INSERT INTO visits VALUES (default, 4, '2026-06-10', 'dental care');
INSERT INTO visits VALUES (default, 5, '2026-06-12', 'checkup');
INSERT INTO visits VALUES (default, 6, '2026-06-15', 'vaccination');
INSERT INTO visits VALUES (default, 7, '2026-06-17', 'wound care');
INSERT INTO visits VALUES (default, 8, '2026-06-19', 'checkup');
INSERT INTO visits VALUES (default, 9, '2026-06-22', 'vaccination');
INSERT INTO visits VALUES (default, 10, '2026-06-25', 'surgery follow-up');
INSERT INTO visits VALUES (default, 11, '2026-06-28', 'checkup');

-- July 2026 (7 visits)
INSERT INTO visits VALUES (default, 1, '2026-07-03', 'checkup');
INSERT INTO visits VALUES (default, 2, '2026-07-07', 'vaccination');
INSERT INTO visits VALUES (default, 3, '2026-07-10', 'checkup');
INSERT INTO visits VALUES (default, 4, '2026-07-14', 'dental cleaning');
INSERT INTO visits VALUES (default, 5, '2026-07-17', 'checkup');
INSERT INTO visits VALUES (default, 6, '2026-07-21', 'vaccination');
INSERT INTO visits VALUES (default, 7, '2026-07-25', 'checkup');

-- August 2026 (13 visits - summer peak)
INSERT INTO visits VALUES (default, 1, '2026-08-01', 'checkup');
INSERT INTO visits VALUES (default, 2, '2026-08-03', 'vaccination');
INSERT INTO visits VALUES (default, 3, '2026-08-05', 'checkup');
INSERT INTO visits VALUES (default, 4, '2026-08-07', 'surgery');
INSERT INTO visits VALUES (default, 5, '2026-08-09', 'checkup');
INSERT INTO visits VALUES (default, 6, '2026-08-11', 'vaccination');
INSERT INTO visits VALUES (default, 7, '2026-08-13', 'dental care');
INSERT INTO visits VALUES (default, 8, '2026-08-15', 'checkup');
INSERT INTO visits VALUES (default, 9, '2026-08-17', 'wound care');
INSERT INTO visits VALUES (default, 10, '2026-08-19', 'checkup');
INSERT INTO visits VALUES (default, 11, '2026-08-21', 'vaccination');
INSERT INTO visits VALUES (default, 12, '2026-08-25', 'surgery follow-up');
INSERT INTO visits VALUES (default, 13, '2026-08-28', 'checkup');

-- September 2026 (10 visits)
INSERT INTO visits VALUES (default, 1, '2026-09-02', 'checkup');
INSERT INTO visits VALUES (default, 2, '2026-09-04', 'vaccination');
INSERT INTO visits VALUES (default, 3, '2026-09-07', 'checkup');
INSERT INTO visits VALUES (default, 4, '2026-09-09', 'dental cleaning');
INSERT INTO visits VALUES (default, 5, '2026-09-12', 'checkup');
INSERT INTO visits VALUES (default, 6, '2026-09-15', 'vaccination');
INSERT INTO visits VALUES (default, 7, '2026-09-18', 'checkup');
INSERT INTO visits VALUES (default, 8, '2026-09-21', 'surgery consultation');
INSERT INTO visits VALUES (default, 9, '2026-09-24', 'checkup');
INSERT INTO visits VALUES (default, 10, '2026-09-27', 'vaccination');

-- October 2026 (8 visits)
INSERT INTO visits VALUES (default, 1, '2026-10-03', 'checkup');
INSERT INTO visits VALUES (default, 2, '2026-10-06', 'vaccination');
INSERT INTO visits VALUES (default, 3, '2026-10-09', 'checkup');
INSERT INTO visits VALUES (default, 4, '2026-10-12', 'dental care');
INSERT INTO visits VALUES (default, 5, '2026-10-15', 'checkup');
INSERT INTO visits VALUES (default, 6, '2026-10-18', 'vaccination');
INSERT INTO visits VALUES (default, 7, '2026-10-21', 'checkup');
INSERT INTO visits VALUES (default, 8, '2026-10-24', 'surgery follow-up');

-- November 2026 (6 visits)
INSERT INTO visits VALUES (default, 1, '2026-11-02', 'checkup');
INSERT INTO visits VALUES (default, 2, '2026-11-05', 'vaccination');
INSERT INTO visits VALUES (default, 3, '2026-11-09', 'checkup');
INSERT INTO visits VALUES (default, 4, '2026-11-12', 'dental cleaning');
INSERT INTO visits VALUES (default, 5, '2026-11-16', 'checkup');
INSERT INTO visits VALUES (default, 6, '2026-11-19', 'vaccination');
