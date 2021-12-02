USE Village
go

CREATE TABLE Produits(
   Id_Produits INT IDENTITY,
   Prod_nom VARCHAR(30)  NOT NULL,
   Prod_Quantite VARCHAR(50)  NOT NULL,
   Prod_Prix MONEY NOT NULL,
   Prod_Photo XML NOT NULL,
   Prod_catégorie VARCHAR(50)  NOT NULL,
   Prod_Ref INT NOT NULL,
   Prod_sous_cat VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_Produits)
);

CREATE TABLE Service_commercial(
   Id_Service_commercial INT IDENTITY,
   Serv_Statutcommande VARCHAR(50)  NOT NULL,
   Serv_NomVendeur VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_Service_commercial)
);

CREATE TABLE Fournisseur(
   Id_Fournisseur INT IDENTITY,
   Four_StockDispo VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_Fournisseur)
);

CREATE TABLE Employé(
   Id_Employé INT IDENTITY,
   Emp_Commercial1 VARCHAR(50) ,
   Emp_Com2 VARCHAR(50) ,
   PRIMARY KEY(Id_Employé)
);

CREATE TABLE Professionnel(
   Id_Professionnel INT IDENTITY,
   Prof_tauxReduc VARCHAR(50)  NOT NULL,
   Prof_AdresseLivraison VARCHAR(150)  NOT NULL,
   Prof_AdresseFacturation VARCHAR(150)  NOT NULL,
   Id_Service_commercial INT NOT NULL,
   Id_Employé INT NOT NULL,
   PRIMARY KEY(Id_Professionnel),
   UNIQUE(Id_Employé),
   FOREIGN KEY(Id_Service_commercial) REFERENCES Service_commercial(Id_Service_commercial),
   FOREIGN KEY(Id_Employé) REFERENCES Employé(Id_Employé)
);

CREATE TABLE _Particulier(
   Id__Particulier INT IDENTITY,
   Part_TauxReduc VARCHAR(50)  NOT NULL,
   Part_AdresseLivraison VARCHAR(150)  NOT NULL,
   Part_AdresseFacturation VARCHAR(150)  NOT NULL,
   Id_Service_commercial INT NOT NULL,
   Id_Employé INT NOT NULL,
   PRIMARY KEY(Id__Particulier),
   UNIQUE(Id_Employé),
   FOREIGN KEY(Id_Service_commercial) REFERENCES Service_commercial(Id_Service_commercial),
   FOREIGN KEY(Id_Employé) REFERENCES Employé(Id_Employé)
);

CREATE TABLE Archives(
   Id_Archives INT IDENTITY,
   Arc_Durée FLOAT NOT NULL,
   Id_Professionnel INT,
   PRIMARY KEY(Id_Archives),
   FOREIGN KEY(Id_Professionnel) REFERENCES Professionnel(Id_Professionnel)
);

CREATE TABLE Passer(
   Id_Professionnel INT,
   Id_Produits INT,
   PRIMARY KEY(Id_Professionnel, Id_Produits),
   FOREIGN KEY(Id_Professionnel) REFERENCES Professionnel(Id_Professionnel),
   FOREIGN KEY(Id_Produits) REFERENCES Produits(Id_Produits)
);

CREATE TABLE Dénombrer(
   Id_Service_commercial INT,
   Id_Fournisseur INT,
   PRIMARY KEY(Id_Service_commercial, Id_Fournisseur),
   FOREIGN KEY(Id_Service_commercial) REFERENCES Service_commercial(Id_Service_commercial),
   FOREIGN KEY(Id_Fournisseur) REFERENCES Fournisseur(Id_Fournisseur)
);

CREATE TABLE Archiver_2(
   Id__Particulier INT,
   Id_Archives INT,
   PRIMARY KEY(Id__Particulier, Id_Archives),
   FOREIGN KEY(Id__Particulier) REFERENCES _Particulier(Id__Particulier),
   FOREIGN KEY(Id_Archives) REFERENCES Archives(Id_Archives)
);

CREATE TABLE Dénombrer_1(
   Id_Produits INT,
   Id_Archives INT,
   Id_Service_commercial INT,
   Den_Quantite VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_Produits, Id_Archives, Id_Service_commercial),
   FOREIGN KEY(Id_Produits) REFERENCES Produits(Id_Produits),
   FOREIGN KEY(Id_Archives) REFERENCES Archives(Id_Archives),
   FOREIGN KEY(Id_Service_commercial) REFERENCES Service_commercial(Id_Service_commercial)
);

CREATE TABLE Commander(
   Id__Particulier INT,
   Id_Produits INT,
   PRIMARY KEY(Id__Particulier, Id_Produits),
   FOREIGN KEY(Id__Particulier) REFERENCES _Particulier(Id__Particulier),
   FOREIGN KEY(Id_Produits) REFERENCES Produits(Id_Produits)
);
go

