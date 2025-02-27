DROP DATABASE `assignment_zad`;

CREATE DATABASE `assignment_zad`;

USE `assignment_zad`;

CREATE TABLE `korisnici` (
  `korisnik_id` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `e_mail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `korisnicko_ime` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `kratka_biografija` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fotografija` blob,
  PRIMARY KEY (`korisnik_id`)
);

CREATE TABLE `status_place` (
  `status_place_id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`status_place_id`)
);

CREATE TABLE `tip_zaposlenja` (
  `tip_zaposlenja_id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tip_zaposlenja_id`)
);


CREATE TABLE `placa` (
  `placa_id` int NOT NULL AUTO_INCREMENT,
  `datum_place` date NOT NULL,
  `iznos_place` decimal(7,2) NOT NULL,
  `korisnik_id` int NOT NULL,
  `status_place_id` int NOT NULL,
  `tip_zaposlenja_id` int NOT NULL,
  PRIMARY KEY (`placa_id`),
  KEY `fk_korisnik_id_idx` (`korisnik_id`),
  KEY `fk_status_place_idx` (`status_place_id`),
  KEY `fk_tip_zaposlenja_id_idx` (`tip_zaposlenja_id`),
  CONSTRAINT `fk_korisnik_id` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnici` (`korisnik_id`),
  CONSTRAINT `fk_status_place_id` FOREIGN KEY (`status_place_id`) REFERENCES `status_place` (`status_place_id`),
  CONSTRAINT `fk_tip_zaposlenja_id` FOREIGN KEY (`tip_zaposlenja_id`) REFERENCES `tip_zaposlenja` (`tip_zaposlenja_id`)
);

CREATE TABLE `status_poruke` (
  `status_poruke_id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`status_poruke_id`)
);

CREATE TABLE `poruke` (
  `poruka_id` int NOT NULL AUTO_INCREMENT,
  `poruka` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `datum_poruke` date NOT NULL,
  `status_poruke_id` int NOT NULL,
  `posiljatelj_poruke_id` int NOT NULL,
  `primatelj_poruke_id` int NOT NULL,
  PRIMARY KEY (`poruka_id`),
  KEY `fk_posiljatelj_poruke_id_idx` (`posiljatelj_poruke_id`),
  KEY `fk_status_poruke_id_idx` (`status_poruke_id`),
  KEY `fk_primatelj_poruke_id_idx` (`primatelj_poruke_id`),
  CONSTRAINT `fk_posiljatelj_poruke_id` FOREIGN KEY (`posiljatelj_poruke_id`) REFERENCES `korisnici` (`korisnik_id`),
  CONSTRAINT `fk_status_poruke_id` FOREIGN KEY (`status_poruke_id`) REFERENCES `status_poruke` (`status_poruke_id`),
  CONSTRAINT `fk_primatelj_poruke_id` FOREIGN KEY (`primatelj_poruke_id`) REFERENCES `korisnici` (`korisnik_id`)
);

INSERT INTO status_place(naziv)
VALUES('isplacena'),
('neisplacena');

INSERT INTO tip_zaposlenja(naziv)
VALUES('neodredjeno'),
('odredjeno');

INSERT INTO status_poruke(naziv)
VALUES('neprocitana'),
('procitana');

INSERT INTO korisnici(ime, prezime, datum_rodjenja, e_mail, korisnicko_ime, kratka_biografija, fotografija) 
VALUES ('Roko', 'Macan', '1985-11-10','rokomacan@mail.com','rokom','Dolazim iz Zagreba. Po struci sam profesor engleskog. Hobiji su mi citanje i setnje uz Savu.',null);
INSERT INTO placa(datum_place,iznos_place,korisnik_id,status_place_id,tip_zaposlenja_id) 
VALUES ('2022-04-10',9852.45,last_insert_id(), 1, 1);


INSERT INTO korisnici(ime, prezime, datum_rodjenja, e_mail, korisnicko_ime, kratka_biografija, fotografija) 
VALUES ('Ana', 'Tomas', '1987-12-21','anatomas@mail.com','anat','Dolazim iz Splita. Po struci sam farmaceut. Hobiji su mi bicikliranje, odlazak na utakmice, te setnja uz rivu.',null);
INSERT INTO placa(datum_place,iznos_place,korisnik_id,status_place_id,tip_zaposlenja_id) 
VALUES ('2022-04-15',10550.50,last_insert_id(), 1, 1);


INSERT INTO korisnici(ime, prezime, datum_rodjenja, e_mail, korisnicko_ime, kratka_biografija, fotografija) 
VALUES ('Mirko', 'Berac', '1990-05-04','mirkoberac@mail.com','mirkob','Dolazim iz Osijeka. Po struci sam kuhar. Hobiji su mi gledanje kulinarskih tv-emisija te igranje sa psom.', LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\boy_128.png'));
INSERT INTO placa(datum_place,iznos_place,korisnik_id,status_place_id,tip_zaposlenja_id) 
VALUES ('2022-04-21',6100.75,last_insert_id(), 1, 2);

/*poruke*/
INSERT INTO poruke(poruka, datum_poruke, status_poruke_id, posiljatelj_poruke_id, primatelj_poruke_id) VALUES('testna poruka 1','2022-05-10', 2, 1, 2);
INSERT INTO poruke(poruka, datum_poruke, status_poruke_id, posiljatelj_poruke_id, primatelj_poruke_id) VALUES('testna poruka 2','2022-05-10', 2, 1, 3);
INSERT INTO poruke(poruka, datum_poruke, status_poruke_id, posiljatelj_poruke_id, primatelj_poruke_id) VALUES('testna poruka 3','2022-05-12', 1, 2, 1);
INSERT INTO poruke(poruka, datum_poruke, status_poruke_id, posiljatelj_poruke_id, primatelj_poruke_id) VALUES('testna poruka 4','2022-05-12', 1, 2, 3);
INSERT INTO poruke(poruka, datum_poruke, status_poruke_id, posiljatelj_poruke_id, primatelj_poruke_id) VALUES('testna poruka 5','2022-05-14', 2, 3, 1);
INSERT INTO poruke(poruka, datum_poruke, status_poruke_id, posiljatelj_poruke_id, primatelj_poruke_id) VALUES('testna poruka 6','2022-05-14', 1, 3, 2);
