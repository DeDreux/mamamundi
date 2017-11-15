DROP DATABASE mamamundi;
CREATE DATABASE mamamundi;
use mamamundi;

CREATE TABLE region(
region_id INT,
region_libelle VARCHAR(50) NOT NULL,
CONSTRAINT pk_region_id PRIMARY KEY (region_id))
;

CREATE TABLE pays(
pays_id INT,
pays_libelle VARCHAR(100) NOT NULL,
pays_region_id INT,
CONSTRAINT pk_pays_id PRIMARY KEY (pays_id),
CONSTRAINT fk_pays_region_id FOREIGN KEY (pays_region_id) REFERENCES region(region_id))
;

CREATE TABLE individu(
individu_id INT NOT NULL,
individu_nom VARCHAR(25) NOT NULL,
individu_prenom VARCHAR(25) NOT NULL,
individu_adresse_mail VARCHAR(55),
individu_adresse1 VARCHAR(250) NOT NULL,
individu_adresse2 VARCHAR(250),
individu_tel VARCHAR(15) not NULL,
CONSTRAINT pk_individu_id PRIMARY KEY (individu_id))
;

CREATE TABLE projet(
projet_id INT,
projet_libelle VARCHAR(100) NOT NULL,
projet_datedebut DATE,
projet_responsable_id INT,
projet_pays_id INT,
CONSTRAINT pk_projet_id PRIMARY KEY (projet_id),
CONSTRAINT fk_projet_individu_id FOREIGN KEY (projet_responsable_id) REFERENCES individu(individu_id),
CONSTRAINT fk_projet_pays_id FOREIGN KEY (projet_pays_id) REFERENCES pays(pays_id))
;

create table participant_projet(
participant_projet_ind_id INT,
participant_projet_pro_id INT,
constraint fk_participant_projet_ind_id foreign key (participant_projet_ind_id) references individu(individu_id),
constraint fk_participant_projet_pro_id foreign key (participant_projet_pro_id) references projet(projet_id))
;

CREATE TABLE article(
article_id int,
article_titre VARCHAR(250) NOT NULL,
article_corps blob,
CONSTRAINT pk_article_id PRIMARY KEY (article_id))
;

CREATE TABLE activite(
activite_id INT,
activite_libelle VARCHAR(25),
activite_article_id INT,
activite_projet INT,
CONSTRAINT pk_activite_id PRIMARY KEY (activite_id),
CONSTRAINT fk_activite_projet FOREIGN KEY (activite_projet) REFERENCES projet (projet_id),
CONSTRAINT fk_activite_article_id FOREIGN KEY (activite_article_id) REFERENCES article(article_id))
;

CREATE TABLE fonction(
fonction_id INT,
fonction_libelle VARCHAR(25) NOT NULL,
CONSTRAINT pk_fonction_id PRIMARY KEY (fonction_id))
;

CREATE TABLE membre(
membre_id INT,
membre_fonction_id INT,
CONSTRAINT pk_membre_id PRIMARY KEY (membre_id),
CONSTRAINT fk_membre_individu_id FOREIGN KEY (membre_id) REFERENCES individu (individu_id),
CONSTRAINT fk_membre_fonction_id FOREIGN KEY (membre_fonction_id) REFERENCES fonction (fonction_id))
;
 
CREATE TABLE donateur(
donateur_id INT,
CONSTRAINT pk_donateur_id PRIMARY KEY (donateur_id),
CONSTRAINT fk_donateur_individu_id FOREIGN KEY (donateur_id) REFERENCES individu (individu_id))
;

CREATE TABLE benevole(
benevole_id INT,
CONSTRAINT pk_benevole_id PRIMARY KEY (benevole_id),
CONSTRAINT fk_benevole_individu_id FOREIGN KEY (benevole_id) REFERENCES individu (individu_id))
;

CREATE TABLE parent(
parent_id INT,
CONSTRAINT pk_parent_id PRIMARY KEY (parent_id),
CONSTRAINT fk_parent_individu_id FOREIGN KEY (parent_id) REFERENCES individu (individu_id))
;

CREATE TABLE enfant(
enfant_id INT,
enfant_nom VARCHAR(50) NOT NULL,
enfant_prenom VARCHAR(50) NOT NULL,
enfant_photo VARCHAR(250),
enfant_parent INT,
enfant_parrain INT,
enfant_projet INT,
CONSTRAINT pk_enfant_id PRIMARY KEY (enfant_id),
CONSTRAINT fk_enfant_parent FOREIGN KEY (enfant_parent) REFERENCES parent (parent_id),
CONSTRAINT fk_enfant_parrain FOREIGN KEY (enfant_parrain) REFERENCES individu (individu_id),
CONSTRAINT fk_enfant_projet FOREIGN KEY (enfant_projet) REFERENCES projet (projet_id))
;

CREATE TABLE suivi(
suivi_id INT,
Compte_rendu BLOB,
suivi_projet INT,
CONSTRAINT pk_suivi_id PRIMARY KEY (suivi_id),
CONSTRAINT fk_suivi_projet FOREIGN KEY (suivi_projet) REFERENCES projet(projet_id))
;

CREATE TABLE reunion(
reunion_id INT,
reunion_libelle VARCHAR(250) NOT NULL,
reunion_date DATE NOT NULL,
reunion_suivi_id INT,
CONSTRAINT pk_reunion_id PRIMARY KEY (reunion_id),
CONSTRAINT fk_reunion_suivi_id FOREIGN KEY (reunion_suivi_id) REFERENCES suivi(suivi_id))
;

