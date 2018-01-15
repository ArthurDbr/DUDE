CREATE TABLE Sexe(
	idSexe Integer PRIMARY KEY not null,
	sexe char(1)
);

CREATE TABLE Personne (
	idPersonne Integer PRIMARY KEY AUTO_INCREMENT not null,
	pseudo varchar(25) not null UNIQUE,
	mail varchar(30),
	prenom varchar(25),
	nom varchar(25),
	date_naissance date,
	idSexe Integer,
	CONSTRAINT FK_idSexe FOREIGN KEY (idSexe)
    REFERENCES Sexe(idSexe)
);

CREATE TABLE TypeEvenement(
	idTypeEvenement Integer PRIMARY KEY not null,
	libelle varchar(20)
);

CREATE TABLE Evenement(
	idEvenement Integer PRIMARY KEY AUTO_INCREMENT not null,
	description varchar(200),
	lieu varchar(100),
	idPersonne Integer not null,
	idTypeEvenement Integer,
	CONSTRAINT idPersonne FOREIGN KEY (idPersonne)
	REFERENCES Personne(idPersonne),
	CONSTRAINT idTypeEvenement FOREIGN KEY (idTypeEvenement)
	REFERENCES TypeEvenement(idTypeEvenement)
);

CREATE TABLE MediaEvenement(
	idEvenement Integer not null,
	idPersonne Integer not null,
	CONSTRAINT idPersonne FOREIGN KEY (idPersonne)
	REFERENCES Personne(idPersonne),
	CONSTRAINT idEvenement FOREIGN KEY (idEvenement)
	REFERENCES Evenement(idEvenement),
	CONSTRAINT idMedia PRIMARY KEY (idEvenement, idPersonne),
	media varchar(70)
);
