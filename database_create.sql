-- MySQL Workbench Synchronization
-- Generated: 2021-03-21 22:27
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: kls

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `events`.`evenement` 
ADD COLUMN `nom` VARCHAR(45) NULL DEFAULT NULL AFTER `idevenement`,
CHANGE COLUMN `type` `type_event` VARCHAR(45) NULL DEFAULT NULL ,
CHANGE COLUMN `date` `date_debut` DATE NOT NULL ,
CHANGE COLUMN `periode` `date_fin` DATE NOT NULL ,
CHANGE COLUMN `etat` `etat` VARCHAR(45) NOT NULL DEFAULT 'VALIDE' ;

ALTER TABLE `events`.`personne` 
DROP INDEX `idx_nom` ;
;

ALTER TABLE `events`.`salle` 
ADD COLUMN `nom_salle` VARCHAR(45) NULL DEFAULT NULL AFTER `nbplace`,
CHANGE COLUMN `nbplace` `nbplace` INT(11) NOT NULL ;

ALTER TABLE `events`.`spectacle` 
ADD COLUMN `date_fin` DATE NOT NULL AFTER `tarif_base`,
ADD COLUMN `idevenement` INT(11) NOT NULL AFTER `date_fin`,
ADD COLUMN `idsalle` INT(11) NOT NULL AFTER `idevenement`,
ADD COLUMN `tarif_pref1` DECIMAL(6,2) NULL DEFAULT NULL AFTER `idsalle`,
ADD COLUMN `tarif_pref2` DECIMAL(6,2) NULL DEFAULT NULL AFTER `tarif_pref1`,
CHANGE COLUMN `nom` `titre_spectacle` VARCHAR(45) NULL DEFAULT NULL ,
CHANGE COLUMN `type` `type_spectacle` VARCHAR(45) NULL DEFAULT NULL ,
CHANGE COLUMN `nb_place` `nb_place_dispo` INT(11) NULL DEFAULT NULL ,
CHANGE COLUMN `date_spectacle` `date_debut` DATE NOT NULL ,
CHANGE COLUMN `tarif` `tarif_base` DECIMAL(6,2) NOT NULL ,
ADD INDEX `fk_spect_event_idx` (`idevenement` ASC),
ADD INDEX `fk_spect_salle_idx` (`idsalle` ASC);
;

ALTER TABLE `events`.`ticket` 
ADD COLUMN `id_personne` INT(11) NULL DEFAULT NULL AFTER `prix`,
ADD COLUMN `idspectacle` INT(11) NOT NULL AFTER `id_personne`,
ADD COLUMN `etat` VARCHAR(10) NOT NULL DEFAULT 'RESERVE' AFTER `idspectacle`,
CHANGE COLUMN `prix` `prix` DECIMAL(6,2) NOT NULL ,
ADD INDEX `fk_personne_ticket_idx` (`id_personne` ASC),
ADD INDEX `fk_spec_ticket_idx` (`idspectacle` ASC);
;

CREATE TABLE IF NOT EXISTS `events`.`Benevole` (
  `idBenevole` INT(11) NOT NULL,
  `specificite` VARCHAR(45) NOT NULL DEFAULT 'Générique',
  `date_debut` DATE NOT NULL DEFAULT sysdate,
  `date_fin` DATE NOT NULL DEFAULT 3999/12/31,
  INDEX `fk_personne_benev_idx` (`idBenevole` ASC),
  PRIMARY KEY (`idBenevole`),
  CONSTRAINT `fk_personne_benev`
    FOREIGN KEY (`idBenevole`)
    REFERENCES `events`.`personne` (`idpersonne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `events`.`ListeEventBenev` (
  `idBenev` INT(11) NOT NULL,
  `idEvent` INT(11) NOT NULL,
  `IdResponsable` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idBenev`, `idEvent`),
  INDEX `fk_liste_event_idx` (`idEvent` ASC),
  INDEX `fk_resp_idx` (`IdResponsable` ASC),
  CONSTRAINT `fk_liste_benev`
    FOREIGN KEY (`idBenev`)
    REFERENCES `events`.`Benevole` (`idBenevole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_liste_event`
    FOREIGN KEY (`idEvent`)
    REFERENCES `events`.`evenement` (`idevenement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resp`
    FOREIGN KEY (`IdResponsable`)
    REFERENCES `events`.`Benevole` (`idBenevole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `events`.`Employee` (
  `idEmployee` INT(11) NOT NULL,
  `poste` VARCHAR(45) NOT NULL,
  `idChef` INT(11) NULL DEFAULT NULL,
  `salaire` INT(11) NULL DEFAULT NULL,
  `date_fin_contrat` DATE NOT NULL DEFAULT 3999/12/31,
  INDEX `fk_salarie_pers_idx` (`idEmployee` ASC),
  INDEX `fk_salarie_chef_idx` (`idChef` ASC),
  PRIMARY KEY (`idEmployee`),
  CONSTRAINT `fk_salarie_pers`
    FOREIGN KEY (`idEmployee`)
    REFERENCES `events`.`personne` (`idpersonne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salarie_chef`
    FOREIGN KEY (`idChef`)
    REFERENCES `events`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `events`.`Artiste` (
  `idArtiste` INT(11) NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  INDEX `fk_art_personne_idx` (`idArtiste` ASC),
  PRIMARY KEY (`idArtiste`),
  CONSTRAINT `fk_art_personne`
    FOREIGN KEY (`idArtiste`)
    REFERENCES `events`.`personne` (`idpersonne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `events`.`ListeArtistSpect` (
  `IdSpectacle` INT(11) NOT NULL,
  `IdArtiste` INT(11) NOT NULL,
  `renumeration` DECIMAL(6,2) NOT NULL,
  `Paye` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`IdSpectacle`, `IdArtiste`),
  INDEX `fk_artiste_liste_idx` (`IdArtiste` ASC),
  CONSTRAINT `fk_artiste_liste`
    FOREIGN KEY (`IdArtiste`)
    REFERENCES `events`.`Artiste` (`idArtiste`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_spect_liste`
    FOREIGN KEY (`IdSpectacle`)
    REFERENCES `events`.`spectacle` (`idspectacle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `events`.`histo_evenement` (
  `idevenement` INT(11) NOT NULL,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `type_event` VARCHAR(45) NULL DEFAULT NULL,
  `date_debut` DATE NOT NULL,
  `date_fin` DATE NOT NULL,
  `etat` VARCHAR(45) NOT NULL DEFAULT 'VALIDE',
  PRIMARY KEY (`idevenement`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `events`.`histo_spectacle` (
  `idspectacle` INT(11) NOT NULL,
  `titre_spectacle` VARCHAR(45) NULL DEFAULT NULL,
  `type_spectacle` VARCHAR(45) NULL DEFAULT NULL,
  `nb_place_dispo` INT(11) NULL DEFAULT NULL,
  `date_debut` DATE NOT NULL,
  `tarif_base` DECIMAL(6,2) NOT NULL,
  `date_fin` DATE NOT NULL,
  `idevenement` INT(11) NOT NULL,
  `idsalle` INT(11) NOT NULL,
  `tarif_pref1` DECIMAL(6,2) NULL DEFAULT NULL,
  `tarif_pref2` DECIMAL(6,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idspectacle`),
  CONSTRAINT `fk_spect_event0`
    FOREIGN KEY ()
    REFERENCES `events`.`histo_evenement` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `events`.`histo_ticket` (
  `idticket` INT(11) NOT NULL,
  `prix` DECIMAL(6,2) NOT NULL,
  `id_personne` INT(11) NULL DEFAULT NULL,
  `idspectacle` INT(11) NOT NULL,
  `paye` VARCHAR(10) NOT NULL DEFAULT 'RESERVE',
  PRIMARY KEY (`idticket`),
  INDEX `fk_personne_ticket_idx` (`id_personne` ASC),
  INDEX `fk_spec_ticket0_idx` (`idspectacle` ASC),
  CONSTRAINT `fk_personne_ticket0`
    FOREIGN KEY (`id_personne`)
    REFERENCES `events`.`personne` (`idpersonne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_spec_ticket0`
    FOREIGN KEY (`idspectacle`)
    REFERENCES `events`.`histo_spectacle` (`idspectacle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `events`.`histo_ListeArtistSpect` (
  `IdSpectacle` INT(11) NOT NULL,
  `IdArtiste` INT(11) NOT NULL,
  `renumeration` DECIMAL(6,2) NOT NULL,
  `Paye` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`IdSpectacle`, `IdArtiste`),
  CONSTRAINT `fk_spect_liste0`
    FOREIGN KEY (`IdSpectacle`)
    REFERENCES `events`.`histo_spectacle` (`idspectacle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `events`.`histo_ListeEventBenev` (
  `idBenev` INT(11) NOT NULL,
  `idEvent` INT(11) NOT NULL,
  `IdResponsable` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idBenev`, `idEvent`),
  INDEX `fk_liste_event0_idx` (`idEvent` ASC),
  CONSTRAINT `fk_liste_event0`
    FOREIGN KEY (`idEvent`)
    REFERENCES `events`.`histo_evenement` (`idevenement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `events`.`spectacle_has_ticket` ;

DROP TABLE IF EXISTS `events`.`spectacle_has_artiste` ;

DROP TABLE IF EXISTS `events`.`personne_has_ticket` ;

DROP TABLE IF EXISTS `events`.`evenement_has_spectacle` ;

DROP TABLE IF EXISTS `events`.`evenement_has_salle` ;

DROP TABLE IF EXISTS `events`.`evenement_has_salarie` ;

DROP TABLE IF EXISTS `events`.`evenement_has_benevole` ;

ALTER TABLE `events`.`spectacle` 
ADD CONSTRAINT `fk_spect_event`
  FOREIGN KEY (`idevenement`)
  REFERENCES `events`.`evenement` (`idevenement`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_spect_salle`
  FOREIGN KEY (`idsalle`)
  REFERENCES `events`.`salle` (`idsalle`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `events`.`ticket` 
ADD CONSTRAINT `fk_personne_ticket`
  FOREIGN KEY (`id_personne`)
  REFERENCES `events`.`personne` (`idpersonne`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_spec_ticket`
  FOREIGN KEY (`idspectacle`)
  REFERENCES `events`.`spectacle` (`idspectacle`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


DELIMITER $$
USE `events`$$
CREATE PROCEDURE `AnnulTicketsImpaye`()
BEGIN
 update ticket
 set etat = 'ANNULE'
 where etat = 'RESERVE'
 and exists(select null from spectacle where idspectacle = t.idspectacle and date_debut - 15/1444 < now());
END$$

DELIMITER ;

DELIMITER $$

USE `events`$$
CREATE DEFINER = CURRENT_USER TRIGGER `events`.`spectacle_AFTER_INSERT` AFTER INSERT ON `spectacle` FOR EACH ROW
BEGIN
	update spectacle set nb_place_dispo = (select nbplace from salle where idsalle = new.idsalle) where idspectacle = new.idspectacle; 
END$$

USE `events`$$
CREATE DEFINER = CURRENT_USER TRIGGER `events`.`ticket_AFTER_INSERT` AFTER INSERT ON `ticket` FOR EACH ROW
BEGIN
 update spectacle set nb_place_dispo = nb_place_dispo-1 where idspectacle = new.id_spectacle;
END$$

USE `events`$$
CREATE DEFINER = CURRENT_USER TRIGGER `events`.`ticket_AFTER_UPDATE` AFTER UPDATE ON `ticket` FOR EACH ROW
BEGIN
 if(new.etat = 'ANNULE' or new.etat = 'REMBOURSE') then
 update spectacle set nb_place_dispo = nb_place_dispo+1 where idspectacle = new.id_spectacle;
 end if;
END$$

USE `events`$$
CREATE DEFINER = CURRENT_USER TRIGGER `events`.`ticket_AFTER_DELETE` AFTER DELETE ON `ticket` FOR EACH ROW
BEGIN
update spectacle set nb_place_dispo = nb_place_dispo+1 where idspectacle = new.id_spectacle;
END$$

USE `events`$$
CREATE DEFINER = CURRENT_USER TRIGGER `events`.`spectacle_AFTER_INSERT` AFTER INSERT ON `spectacle` FOR EACH ROW
BEGIN
	update spectacle set nb_place_dispo = (select nbplace from salle where idsalle = new.idsalle) where idspectacle = new.idspectacle; 
END$$

USE `events`$$
CREATE DEFINER = CURRENT_USER TRIGGER `events`.`ticket_AFTER_INSERT` AFTER INSERT ON `ticket` FOR EACH ROW
BEGIN
 update spectacle set nb_place_dispo = nb_place_dispo-1 where idspectacle = new.id_spectacle;
END$$

USE `events`$$
CREATE DEFINER = CURRENT_USER TRIGGER `events`.`ticket_AFTER_UPDATE` AFTER UPDATE ON `ticket` FOR EACH ROW
BEGIN
 if(new.etat = 'ANNULE') then
 update spectacle set nb_place_dispo = nb_place_dispo+1 where idspectacle = new.id_spectacle;
 end if;
END$$

USE `events`$$
CREATE DEFINER = CURRENT_USER TRIGGER `events`.`ticket_AFTER_DELETE` AFTER DELETE ON `ticket` FOR EACH ROW
BEGIN
update spectacle set nb_place_dispo = nb_place_dispo+1 where idspectacle = new.id_spectacle;
END$$


DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
