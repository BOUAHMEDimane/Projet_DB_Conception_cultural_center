-- MySQL Workbench Synchronization
-- Generated: 2021-03-30 00:17
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: kls

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP TABLE IF EXISTS `espaceculturel`.`ticket` ;

DROP TABLE IF EXISTS `espaceculturel`.`spectacle` ;

DROP TABLE IF EXISTS `espaceculturel`.`salle` ;

DROP TABLE IF EXISTS `espaceculturel`.`salarie_has_evenement` ;

DROP TABLE IF EXISTS `espaceculturel`.`salarie` ;

DROP TABLE IF EXISTS `espaceculturel`.`evenement_has_benevole` ;

DROP TABLE IF EXISTS `espaceculturel`.`evenement` ;

DROP TABLE IF EXISTS `espaceculturel`.`client_has_ticket` ;

DROP TABLE IF EXISTS `espaceculturel`.`client` ;

DROP TABLE IF EXISTS `espaceculturel`.`benevole` ;

DROP TABLE IF EXISTS `espaceculturel`.`artiste_has_spectacle` ;

DROP TABLE IF EXISTS `espaceculturel`.`artiste` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
