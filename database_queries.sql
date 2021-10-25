/*PARTIE 3*/
/*1*/
select b.nom, b.prenom, floor(datediff(current_date(),date_naissance)/365) as age,l.idEvent,e.nom,e.type_event
from v_benevol b
left join listeeventbenev l
on b.idBenevole = l.idBenev 
left join evenement e on e.idEvenement = l.idEvent;

/*2*/
select sum(renumeration)
from listeartistspect l, spectacle s
where l.IdSpectacle = s.IdSpectacle
and s.date_fin > '2021-01-01'
and s.date_fin < '2021-06-01';

/*3*/
select sum(nb_place_dispo)
from spectacle
where idevenement = '2';

/*4*/
select datediff(date_debut,current_date()) as temps_restant
from evenement
where idevenement = '7';/*@id_event*/

/*5*/
/*rappel : ticket payé a la valeur PAYE dans etat*/
select idevenement,sum(prix) as ventes, sum(prix)-sum(renumeration) as benefices
from ticket t,spectacle s, listeartistspect l
where s.idspectacle = t.idspectacle
and l.IdSpectacle = s.IdSpectacle
and t.etat = 'PAYE'
group by idevenement
order by sum(prix) desc;

/*6*/
/*event*/
insert into evenement(idevenement,nom,type_event,date_debut,date_fin)
select max(idevenement)+1,'event_test','cinema','2021-07-01','2021-07-07' 
FROM evenement;
/*spect 01*/
insert into spectacle(idspectacle,idevenement,date_debut,date_fin,tarif_base,idsalle)
select max(idspectacle)+1,(select max(idevenement) FROM evenement),'2021-07-01 18:00','2021-07-01 22:00',10,1 
FROM spectacle;
/*spect 02*/
insert into spectacle(idspectacle,idevenement,date_debut,date_fin,tarif_base,idsalle)
select max(idspectacle)+1,(select max(idevenement) FROM evenement),'2021-07-02 18:00','2021-07-02 22:00',10,2 
FROM spectacle;
/*spect 03*/
insert into spectacle(idspectacle,idevenement,date_debut,date_fin,tarif_base,idsalle)
select max(idspectacle)+1,(select max(idevenement) FROM evenement),'2021-07-01 18:00','2021-07-01 22:00',10,3 
FROM spectacle;
/*spect 04*/
insert into spectacle(idspectacle,idevenement,date_debut,date_fin,tarif_base,idsalle)
select max(idspectacle)+1,(select max(idevenement) FROM evenement),'2021-07-01 14:00','2021-07-01 16:00',10,1 
FROM spectacle;
/*spect 05*/
insert into spectacle(idspectacle,idevenement,date_debut,date_fin,tarif_base,idsalle)
select max(idspectacle)+1,(select max(idevenement) FROM evenement),'2021-07-03 18:00','2021-07-03 22:00',10,2 
FROM spectacle;
/*spect 06*/
insert into spectacle(idspectacle,idevenement,date_debut,date_fin,tarif_base,idsalle)
select max(idspectacle)+1,(select max(idevenement) FROM evenement),'2021-07-04 18:00','2021-07-04 22:00',10,3 
FROM spectacle;
/*spect 07*/
insert into spectacle(idspectacle,idevenement,date_debut,date_fin,tarif_base,idsalle)
select max(idspectacle)+1,(select max(idevenement) FROM evenement),'2021-07-05 18:00','2021-07-05 22:00',10,1 
FROM spectacle;

/*7*/
/*pour l'année 2019*/
select sum(salaire*least(timestampdiff(MONTH,date_debut_contrat,'2019-12-31'),12)) as salaires
from employee
where date_fin_contrat > '2019-12-31'
and date_debut_contrat < '2019-12-31';

/*8*/
select s.idevenement,sum(if(t.prix=s.tarif_base,1,0)) as nb_tick_tarif_base,
					sum(if(t.prix=s.tarif_pref1,1,0)) as nb_ticket_tarif_pref1,
                    sum(if(t.prix=s.tarif_pref2,1,0)) as nb_ticket_tarif_pref2
from ticket t, spectacle s
where t.idspectacle = s.idspectacle
group by s.idevenement;

/*9*/
select type_spectacle,round(100*count(*)/(select count(*) from spectacle where date_debut > '2021-01-01'
and date_fin < '2022-01-01'),2) as 'nb%'
from spectacle s 
where date_debut > '2021-01-01'
and date_fin < '2022-01-01'
group by type_spectacle;

/*10*/
select e.idevenement,e.nom,sum(t.prix) as montant_rembourse
from evenement e, spectacle s, ticket t
where e.etat = 'ANNULE'
and s.idevenement = e.idevenement
and t.idspectacle = s.idspectacle
/*and t.etat = 'REMBOURSE'*/
group by e.idevenement,e.nom;