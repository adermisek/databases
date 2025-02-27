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


/*zadatak 2*/
use  assignment_zad;
/* indeksi*/

-- --------------------------------- INDEXI ------------------------------------------------------


ALTER TABLE `assignment_zad`.`korisnici` 
ADD INDEX `idx_ime_prezime` (`prezime` ASC, `ime` ASC) INVISIBLE,
ADD INDEX `idx_korisnicko_ime` (`korisnicko_ime` ASC) VISIBLE,
ADD FULLTEXT INDEX `idx_biografija` (`kratka_biografija`) INVISIBLE;


ALTER TABLE `assignment_zad`.`placa` 
ADD INDEX `idx_datum_place` (`datum_place` ASC) VISIBLE;


ALTER TABLE `assignment_zad`.`poruke` 
ADD FULLTEXT INDEX `idx_poruka` (`poruka`) INVISIBLE,
ADD INDEX `idx_datum_poruke` (`datum_poruke` ASC) VISIBLE;

-- --------------------------------- POGLEDI ------------------------------------------------------


/*pogled, pošto nema mjesta rođenja dodana kratka biografija*/
CREATE VIEW korisnici_pogled as 
SELECT ime, prezime, datum_rodjenja, kratka_biografija FROM korisnici;

-- --------------------------------- PROCEDURE KORISNICI -----------------------------------------------

DROP PROCEDURE IF EXISTS `dodaj_korisnika`;
DELIMITER //
CREATE PROCEDURE `dodaj_korisnika` (ime varchar(45), prezime  varchar(45), datum_rodjenja date, e_mail  varchar(50), korisnicko_ime  varchar(45), kratka_biografija  varchar(4000), fotografija blob)
BEGIN
	INSERT INTO korisnici(`ime`, `prezime`, `datum_rodjenja`, `e_mail`, `korisnicko_ime`, `kratka_biografija`, `fotografija`) 
    VALUES (ime, prezime, datum_rodjenja, e_mail, korisnicko_ime, kratka_biografija, fotografija);
END//
DELIMITER ;

-- call dodaj_korisnika('Test', 'Testic', '2000-12-03', 'test@mail.com', 'test', 'Ovo je super biografija', null);

DROP PROCEDURE IF EXISTS `izmijeni_korisnika`;
DELIMITER //
CREATE PROCEDURE `izmijeni_korisnika` (
	param_id INT, 
    param_ime varchar(45), 
    param_prezime  varchar(45), 
    param_datum_rodjenja date, 
    param_e_mail  varchar(50), 
    param_korisnicko_ime  varchar(45), 
    param_kratka_biografija  varchar(4000), 
    param_fotografija blob)
BEGIN
	SET @id_temp = (SELECT korisnik_id from korisnici where korisnik_id = param_id);
    
    IF @id_temp is null THEN
		SELECT 'Korisnik sa tim id-em ne postoji' as Iznimka;
	ELSE    
		UPDATE korisnici SET
		`ime` = param_ime,
		`prezime` = param_prezime,
		`datum_rodjenja` = param_datum_rodjenja,
		`e_mail` = param_e_mail,
		`korisnicko_ime` = param_korisnicko_ime,
		`kratka_biografija` = param_kratka_biografija,
		`fotografija` = param_fotografija
		WHERE korisnik_id = param_id;
	END IF;
END//
DELIMITER ;

-- call izmijeni_korisnika(4, 'Test3', 'Testic2', '2000-12-02', 'test2@mail.com', 'test2', 'Ovo je super biografija2', null);
-- call izmijeni_korisnika(12, 'Test3', 'Testic2', '2000-12-02', 'test2@mail.com', 'test2', 'Ovo je super biografija2', null);

DROP PROCEDURE IF EXISTS `obrisi_korisnika`;
DELIMITER //
CREATE PROCEDURE `obrisi_korisnika` (param_id INT)
BEGIN
	SET @id_temp = (SELECT korisnik_id from korisnici where korisnik_id = param_id);
    
    IF @id_temp is null THEN
		SELECT 'Korisnik sa tim id-em ne postoji' as Iznimka;
	ELSE    
		DELETE FROM korisnici WHERE korisnik_id = param_id;
	END IF;
END//
DELIMITER ;

-- call obrisi_korisnika(4);
-- call obrisi_korisnika(4);

-- --------------------------------- PROCEDURE PLACA -----------------------------------------------

DROP PROCEDURE IF EXISTS `dodaj_placu`;
DELIMITER //
CREATE PROCEDURE `dodaj_placu` (
	param_datum_place date, 
    param_iznos_place decimal(7,2), 
    param_korisnik_id INT, 
    param_status_place_id INT, 
    param_tip_zaposlenja_id INT)
BEGIN
	SET @korisnik_id_temp = (SELECT `korisnik_id` from korisnici where `korisnik_id` = param_korisnik_id);
	SET @status_place_id_temp = (SELECT `status_place_id` from status_place where `status_place_id` = param_status_place_id);
	SET @tip_zaposlenja_id_temp = (SELECT `tip_zaposlenja_id` from tip_zaposlenja where `tip_zaposlenja_id` = param_tip_zaposlenja_id);
    
    IF @korisnik_id_temp is null THEN
		SELECT 'Korisnik sa tim id-em ne postoji' as Iznimka;
	ELSEIF @status_place_id_temp is null THEN
		SELECT 'Status place sa tim id-em ne postoji' as Iznimka;
	ELSEIF @tip_zaposlenja_id_temp is null THEN
		SELECT 'Tip zaposlenja sa tim id-em ne postoji' as Iznimka;
	ELSE    
		INSERT INTO placa(`datum_place`, `iznos_place`, `korisnik_id`, `status_place_id`, `tip_zaposlenja_id`) 
        VALUES (param_datum_place, param_iznos_place, param_korisnik_id, param_status_place_id, param_tip_zaposlenja_id);
	END IF;

END//
DELIMITER ;

-- call dodaj_placu('2022-01-01', 1234.56, 2, 2, 2);

DROP PROCEDURE IF EXISTS `izmijeni_placu`;
DELIMITER //
CREATE PROCEDURE `izmijeni_placu` (
    param_id INT,
	param_datum_place date, 
    param_iznos_place decimal(7,2), 
    param_korisnik_id INT, 
    param_status_place_id INT, 
    param_tip_zaposlenja_id INT)
BEGIN
	SET @id_temp = (SELECT `placa_id` from placa where `placa_id` = param_id);
	SET @korisnik_id_temp = (SELECT `korisnik_id` from korisnici where `korisnik_id` = param_korisnik_id);
	SET @status_place_id_temp = (SELECT `status_place_id` from status_place where `status_place_id` = param_status_place_id);
	SET @tip_zaposlenja_id_temp = (SELECT `tip_zaposlenja_id` from tip_zaposlenja where `tip_zaposlenja_id` = param_tip_zaposlenja_id);
    
    IF @id_temp is null THEN
		SELECT 'Placa sa tim id-em ne postoji' as Iznimka;
    ELSEIF @korisnik_id_temp is null THEN
		SELECT 'Korisnik sa tim id-em ne postoji' as Iznimka;
	ELSEIF @status_place_id_temp is null THEN
		SELECT 'Status place sa tim id-em ne postoji' as Iznimka;
	ELSEIF @tip_zaposlenja_id_temp is null THEN
		SELECT 'Tip zaposlenja sa tim id-em ne postoji' as Iznimka;
	ELSE
		UPDATE placa SET
		`datum_place` = param_datum_place,
		`iznos_place` = param_iznos_place,
		`korisnik_id` = param_korisnik_id,
		`status_place_id` = param_status_place_id,
		`tip_zaposlenja_id` = param_tip_zaposlenja_id
		WHERE placa_id = param_id;
	END IF;
END//
DELIMITER ;

-- call izmijeni_placu(6, '2022-01-02', 1234.76, 1, 1, 2);


DROP PROCEDURE IF EXISTS `obrisi_placu`;
DELIMITER //
CREATE PROCEDURE `obrisi_placu` (param_id INT)
BEGIN
	SET @id_temp = (SELECT placa_id from placa where placa_id = param_id);
    
    IF @id_temp is null THEN
		SELECT 'Placa sa tim id-em ne postoji' as Iznimka;
	ELSE    
		DELETE FROM placa WHERE placa_id = param_id;
	END IF;
END//
DELIMITER ;

-- call obrisi_placu(6);

-- --------------------------------- PROCEDURE PORUKE -----------------------------------------------

DROP PROCEDURE IF EXISTS `dodaj_poruku`;
DELIMITER //
CREATE PROCEDURE `dodaj_poruku` (
	param_poruka varchar(4000),
    param_datum_poruke date, 
    param_status_poruke_id INT, 
    param_posiljatelj_poruke_id INT, 
    param_primatelj_poruke_id INT)
BEGIN
	SET @status_poruke_id_temp = (SELECT `status_poruke_id` from status_poruke where `status_poruke_id` = param_status_poruke_id);
	SET @posiljatelj_poruke_id_temp = (SELECT `korisnik_id` from korisnici where `korisnik_id` = param_posiljatelj_poruke_id);
	SET @primatelj_poruke_id_temp = (SELECT `korisnik_id` from korisnici where `korisnik_id` = param_primatelj_poruke_id);
    
    IF @status_poruke_id_temp is null THEN
		SELECT 'Status poruke sa tim id-em ne postoji' as Iznimka;
	ELSEIF @posiljatelj_poruke_id_temp is null THEN
		SELECT 'Korisnik (posiljatelj) sa tim id-em ne postoji' as Iznimka;
	ELSEIF @primatelj_poruke_id_temp is null THEN
		SELECT 'Korisnik (primatelj) sa tim id-em ne postoji' as Iznimka;
	ELSE    
		INSERT INTO poruke(`poruka`, `datum_poruke`, `status_poruke_id`, `posiljatelj_poruke_id`, `primatelj_poruke_id`) 
        VALUES (param_poruka, param_datum_poruke, param_status_poruke_id, param_posiljatelj_poruke_id, param_primatelj_poruke_id);
	END IF;

END//
DELIMITER ;

-- call dodaj_poruku('Testna poruka 1','2022-01-03',1,2,21);


DROP PROCEDURE IF EXISTS `izmijeni_poruku`;
DELIMITER //
CREATE PROCEDURE `izmijeni_poruku` (
	param_id INT,
	param_poruka varchar(4000),
    param_datum_poruke date, 
    param_status_poruke_id INT, 
    param_posiljatelj_poruke_id INT, 
    param_primatelj_poruke_id INT)
BEGIN
	SET @id_temp = (SELECT `poruka_id` from poruke where `poruka_id` = param_id);
	SET @status_poruke_id_temp = (SELECT `status_poruke_id` from status_poruke where `status_poruke_id` = param_status_poruke_id);
	SET @posiljatelj_poruke_id_temp = (SELECT `korisnik_id` from korisnici where `korisnik_id` = param_posiljatelj_poruke_id);
	SET @primatelj_poruke_id_temp = (SELECT `korisnik_id` from korisnici where `korisnik_id` = param_primatelj_poruke_id);
    
    IF @id_temp is null THEN
		SELECT 'Poruka sa tim id-em ne postoji' as Iznimka;
    ELSEIF @status_poruke_id_temp is null THEN
		SELECT 'Status poruke sa tim id-em ne postoji' as Iznimka;
	ELSEIF @posiljatelj_poruke_id_temp is null THEN
		SELECT 'Korisnik (posiljatelj) sa tim id-em ne postoji' as Iznimka;
	ELSEIF @primatelj_poruke_id_temp is null THEN
		SELECT 'Korisnik (primatelj) sa tim id-em ne postoji' as Iznimka;
	ELSE    
		UPDATE poruke SET
		`poruka` = param_poruka,
		`datum_poruke` = param_datum_poruke,
		`status_poruke_id` = param_status_poruke_id,
		`posiljatelj_poruke_id` = param_posiljatelj_poruke_id,
		`primatelj_poruke_id` = param_primatelj_poruke_id
		WHERE poruka_id = param_id;
	END IF;

END//
DELIMITER ;

-- call izmijeni_poruku(6, 'Testna poruka 11','2022-01-02',2,3,1);

DROP PROCEDURE IF EXISTS `obrisi_poruku`;
DELIMITER //
CREATE PROCEDURE `obrisi_poruku` (param_id INT)
BEGIN
	SET @id_temp = (SELECT poruka_id from poruke where poruka_id = param_id);
    
    IF @id_temp is null THEN
		SELECT 'Poruka sa tim id-em ne postoji' as Iznimka;
	ELSE    
		DELETE FROM poruke WHERE poruka_id = param_id;
	END IF;
END//
DELIMITER ;

-- call obrisi_poruku(6);
-- call obrisi_poruku(6);


-- --------------------------------- FUNKCIJA ---------------------------------------------------


DROP FUNCTION IF EXISTS prebroji_poslane_poruke_korisnika;
DELIMITER //
CREATE FUNCTION prebroji_poslane_poruke_korisnika(param_korisnik_id INT) 
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE broj_poslanih_poruka INT;
	
   	SET @id_temp = (SELECT korisnik_id from korisnici where korisnik_id = param_korisnik_id);
    SET broj_poslanih_poruka = (SELECT COUNT(*) FROM poruke where posiljatelj_poruke_id = param_korisnik_id);
	
    IF @id_temp is null THEN
		SET broj_poslanih_poruka = -1;
	ELSE
		SET broj_poslanih_poruka = (SELECT COUNT(*) FROM poruke where posiljatelj_poruke_id = param_korisnik_id);
    END IF;

	RETURN broj_poslanih_poruka;
END; //
DELIMITER ;

-- SELECT prebroji_poslane_poruke_korisnika(1);
-- SELECT prebroji_poslane_poruke_korisnika(2);
-- SELECT prebroji_poslane_poruke_korisnika(3);
-- SELECT prebroji_poslane_poruke_korisnika(5);
-- SELECT prebroji_poslane_poruke_korisnika(1111);


-- call dodaj_korisnika('Test', 'Testic', '2000-12-03', 'test@mail.com', 'test', 'Ovo je super biografija', null);
-- call izmijeni_korisnika(4, 'Test3', 'Testic2', '2000-12-02', 'test2@mail.com', 'test2', 'Ovo je super biografija2', null);
-- call izmijeni_korisnika(12, 'Test3', 'Testic2', '2000-12-02', 'test2@mail.com', 'test2', 'Ovo je super biografija2', null);
-- call obrisi_korisnika(4);
-- call obrisi_korisnika(4);
-- call dodaj_placu('2022-01-01', 1234.56, 2, 2, 2);
-- call izmijeni_placu(6, '2022-01-02', 1234.76, 1, 1, 2);
-- call obrisi_placu(6);
-- call dodaj_poruku('Testna poruka 1','2022-01-03',1,2,21);
-- call izmijeni_poruku(6, 'Testna poruka 11','2022-01-02',2,3,1);
-- call obrisi_poruku(6);
-- call obrisi_poruku(6);
