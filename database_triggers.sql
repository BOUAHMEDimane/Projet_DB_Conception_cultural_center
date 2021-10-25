DELIMITER $$
USE `events`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AnnulTicketsImpaye`()
BEGIN
 delete from ticket
 where etat = 'RESERVE'
 and exists(select null from spectacle where idspectacle = t.idspectacle and date_debut - 15/1444 < now());
END$$

CREATE DEFINER=`root`@`localhost` TRIGGER `events`.`ticket_AFTER_INSERT` AFTER INSERT ON `ticket` FOR EACH ROW
BEGIN
 update spectacle set nb_place_dispo = nb_place_dispo-1 where idspectacle = new.idspectacle;
END$$

CREATE DEFINER=`root`@`localhost` TRIGGER `events`.`ticket_AFTER_UPDATE` AFTER UPDATE ON `ticket` FOR EACH ROW
BEGIN
 if(new.etat = 'REMBOURSE') then
 update spectacle set nb_place_dispo = nb_place_dispo+1 where idspectacle = new.idspectacle;
 end if;
END$$
CREATE DEFINER=`root`@`localhost` TRIGGER `events`.`ticket_BEFORE_DELETE` BEFORE DELETE ON `ticket` FOR EACH ROW
BEGIN
 DECLARE msg varchar(255);
 if(old.etat!='RESERVE') then
 SET msg = 'Interdit de supprimer un ticket';
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
 end if;
END$$

CREATE DEFINER=`root`@`localhost` TRIGGER `events`.`ticket_BEFORE_DELETE` BEFORE DELETE ON `ticket` FOR EACH ROW
BEGIN
 DECLARE msg varchar(255);
 if(old.etat!='RESERVE') then
 SET msg = 'Interdit de supprimer un ticket';
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
 end if;
END$$

CREATE DEFINER=`root`@`localhost` TRIGGER `events`.`spectacle_BEFORE_INSERT` BEFORE INSERT ON `spectacle` FOR EACH ROW
BEGIN
 	set new.nb_place_dispo = (select nbplace from salle where idsalle = new.idsalle); 
END$$

CREATE DEFINER=`root`@`localhost` TRIGGER `events`.`evenement_BEFORE_DELETE` BEFORE DELETE ON `evenement` FOR EACH ROW
 BEGIN
 DECLARE msg varchar(255);
 SET msg = 'Interdit de supprimer un évènement';
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END$$


CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_benevol` AS
    SELECT 
        `b`.`idBenevole` AS `idBenevole`,
        `b`.`specificite` AS `specificite`,
        `b`.`date_debut` AS `date_debut`,
        `b`.`date_fin` AS `date_fin`,
        `p`.`idpersonne` AS `idpersonne`,
        `p`.`nom` AS `nom`,
        `p`.`prenom` AS `prenom`,
        `p`.`adresse` AS `adresse`,
        `p`.`mail` AS `mail`,
        `p`.`telephone` AS `telephone`,
        `p`.`date_naissance` AS `date_naissance`
    FROM
        (`benevole` `b`
        JOIN `personne` `p`)
    WHERE
        (`b`.`idBenevole` = `p`.`idpersonne`)