#
    # TABLE STRUCTURE FOR: administrateur
    #
DROP TABLE IF EXISTS
    `administrateur`;
CREATE TABLE `administrateur`(
    `id` INT(9) ,
    `nom` VARCHAR(255) NOT NULL,
    `prenom` VARCHAR(255) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
#
# TABLE STRUCTURE FOR: cinema
#
DROP TABLE IF EXISTS
    `cinema`;
CREATE TABLE `cinema`(
    `id` INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(255) NOT NULL,
    `lieu` VARCHAR(255) NOT NULL,
    PRIMARY KEY `id`(`id`),
    `idadministeur` INT,
    `idutilisateur` INT,
    `idseance` INT,
    `idfilm` INT,
    FOREIGN KEY(idadministrateur) REFERENCES administrateur(id),
    FOREIGN KEY(idutilisateur) REFERENCES utilisateur(id),
    FOREIGN KEY(idseance) REFERENCES seance(id),
    FOREIGN KEY(idfilm) REFERENCES film(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
#
# TABLE STRUCTURE FOR: client
#
# TABLE STRUCTURE FOR: administrateur
#
DROP TABLE IF EXISTS
    `administrateur`;
CREATE TABLE `administrateur`(
    `id` INT(9),
    `nom` VARCHAR(255) NOT NULL,
    `prenom` VARCHAR(255) NOT NULL,
    `idcimena` INT,
    `idseance` INT,
    `idfilm` INT,
    FOREIGN KEY(idcinema) REFERENCES cinema(id),
    FOREIGN KEY(idseance) REFERENCES seance(id),
    FOREIGN KEY(idfilm) REFERENCES film(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
#
# TABLE STRUCTURE FOR: cinema
#
DROP TABLE IF EXISTS
    `cinema`;
CREATE TABLE `cinema`(
    `id` INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(255) NOT NULL,
    `lieu` VARCHAR(255) NOT NULL,
    PRIMARY KEY `id`(`id`),
    `idadministrateur` INT,
    `idutilisateur` INT,
    `idfilm` INT,
    `idseance` INT,
    FOREIGN KEY(idadministrateur) REFERENCES administateur(id),
    FOREIGN KEY(idutilisateur) REFERENCES utilisateur(id),
    FOREIGN KEY(idseance) REFERENCES seance(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
#
# TABLE STRUCTURE FOR: client
#
DROP TABLE IF EXISTS
    `client`;
CREATE TABLE `client`(
    `id` INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(255) NOT NULL,
    `age` INT(9) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`id`),
    KEY `email`(`email`),
    `susreservationid` INT,
    FOREIGN KEY(susreservationid) REFERENCES susreservation(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
#
# TABLE STRUCTURE FOR: film
#
DROP TABLE IF EXISTS
    `film`;
CREATE TABLE `film`(
    `id` INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `duree` TIME DEFAULT NULL,
    `nom` VARCHAR(255) NOT NULL,
    PRIMARY KEY `id`(`id`),
    `seanceid` INT,
    `cinemaid` INT,
    FOREIGN KEY(seanceid) REFERENCES seance(id),
    FOREIGN KEY(cinemaid) REFERENCES cinema(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
#
# TABLE STRUCTURE FOR: prix
#
DROP TABLE IF EXISTS
    `prix`;
CREATE TABLE `prix`(
    `id` INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `tarif` INT(9) NOT NULL,
    `nom` VARCHAR(255) NOT NULL,
    PRIMARY KEY `id`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
#
# TABLE STRUCTURE FOR: salle
#
DROP TABLE IF EXISTS
    `salle`;
CREATE TABLE `salle`(
    `id` INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(255) NOT NULL,
    `nombredeplace` INT(9) UNSIGNED NOT NULL,
    KEY `id`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
#
# TABLE STRUCTURE FOR: seance
#
DROP TABLE IF EXISTS
    `seance`;
CREATE TABLE `seance`(
    `id` INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `dateheure` DATETIME NOT NULL,
    PRIMARY KEY `id`(`id`),
    `seanceid` INT,
    `cinemaid` INT,
    `filmid` INT,
    FOREIGN KEY(seanceid) REFERENCES seance(id),
    FOREIGN KEY(cinemaid) REFERENCES cinema(id),
    FOREIGN KEY(filmid) REFERENCES film(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
#
# TABLE STRUCTURE FOR: susreservation
#
DROP TABLE IF EXISTS
    `susreservation`;
CREATE TABLE `susreservation`(
    `transactionid` INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `modepaiment` VARCHAR(255) NOT NULL,
    PRIMARY KEY `transactionid`(`transactionid`),
    `clientid` INT,
    `prixid` INT,
    FOREIGN KEY(clientid) REFERENCES CLIENT(id),
    FOREIGN KEY(prixid) REFERENCES prix(id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
#
# TABLE STRUCTURE FOR: utilisateur
#
DROP TABLE IF EXISTS
    `utilisateur`;
CREATE TABLE `utilisateur`(
    `id` INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(255) NOT NULL,
    `prenom` VARCHAR(255) NOT NULL,
   PRIMARY KEY `id`(`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO `client`
VALUES(
    1,
    'Colton',
    1,
    'monte56@example.org'
),(
    2,
    'Hildegard',
    1,
    'tara81@example.net'
),(
    3,
    'Kevon',
    6,
    'oscar.mayert@example.org'
),(
    4,
    'Jayda',
    1,
    'harold.runolfsdottir@example.net'
),(
    5,
    'Aaron',
    2,
    'karmstrong@example.net'
);
INSERT INTO `film`
VALUES(1, '19:00:00', 'Jeromele mortel'),(2, '19:40:00', 'La tour infernale'),(
    3,
    '05:35:00',
    'Jovanny et son skate'
),(
    4,
    '20:00:00',
    'Robbie et les miniMoy'
),(5, '21:48:00', 'Caden et candenne');
INSERT INTO `cinema`
VALUES(1, 'Stamm Multiplex', 'Paris'),(2, 'Schuppe CGR', 'Lyon'),(3, 'WhiteScreen', 'Agde'),(4, '2000Project', 'Pau'),(5, 'HandWritter', 'Mans');
INSERT INTO `seance`
VALUES(1, '1993-05-20 00:02:48'),(2, '1984-11-10 00:13:50'),(3, '1993-11-24 15:20:03'),(4, '2018-10-08 21:42:31'),(5, '1998-01-21 18:10:38');
INSERT INTO `prix`
VALUES(9, 20, 'Plein tarif'),(7, 60, 'Etudiant'),(5, 90, 'Moins de 14 ans');
INSERT INTO `administrateur`
VALUES(1, 'Schmeler', 'Benny'),(2, 'Bernhard', 'Nicholaus'),(3, 'Schamberger', 'Matt'),(4, 'Kihn', 'Taylor'),(5, 'Friesen', 'Carson');
INSERT INTO `salle`
VALUES(1, 'Howell', 200),(2, 'Sporer', 105),(3, 'Rempel', 250),(4, 'Sipes', 300),(5, 'Conroy', 300);
INSERT INTO `utilisateur`
VALUES(1, 'Samir', 'Brakus'),(2, 'Antwon', 'Steuber'),(3, 'Terry', 'Weber'),(4, 'Danial', 'Douglas'),(5, 'Seamus', 'Cole');
INSERT INTO `susreservation`
VALUES(1, 'CB'),(2, 'CB'),(3, 'et'),(4, 'CB'),(5, 'CB');

