-- USE master;

-- Create database VillageGreen;


use VillageGreen

CREATE TABLE Pays (
   pay_id INT NOT NULL PRIMARY KEY,
   pay_libelle varchar(55) NOT NULL UNIQUE
);

CREATE TABLE Categorie ( 
   Cat_ID      INT NOT NULL,
   Cat_nom   Varchar (55) NOT NULL UNIQUE,
   cat_parent   INT NOT NULL,

   Constraint PK_Categorie PRIMARY KEY (cat_ID),
   Constraint FK_Categorie_Categorie  FOREIGN KEY (cat_parent) REFERENCES categorie(Cat_ID)
);

CREATE TABLE Poste (
  Pos_ID INT NOT NULL PRIMARY KEY,
  Pos_Libelle Varchar (255) NOT NULL,
  POS_Description   Varchar (50) NOT NULL,
  );

  CREATE TABLE Client (
  Cli_ID INT NOT NULL PRIMARY KEY,
  Cli_Nom Varchar (35) NOT NULL,
  Cli_Prenom Varchar (35) NOT NULL,
  Cli_Sexe Varchar (35) NOT NULL,
  Cli_date_de_naissance Date NOT NULL,
  Cli_Adresse_de_facturation Varchar(55) NOT NULL,
  Cli_Adresse_Livraison Varchar (55) NOT NULL,
  Cli_CP  INT NOT NULL,
  Cli_Ville Varchar(35) NOT NULL,
  Cli_Telephone INT NOT NULL,
  Cli_Mail Varchar (255) NOT NULL,
  Cli_Motdepasse Varchar (60) NOT NULL,
  Cli_Login Varchar (60) NOT NULL,
  Cli_type BIT NOT NULL,
  Cli_Coefficient Decimal(4,2) NOT NULL,
  Cli_Reference Varchar (10) NOT NULL,
  );

  CREATE TABLE Employe (
  Emp_ID INT NOT NULL PRIMARY KEY,
  Emp_date_entree DATE NOT NULL,
  Pos_ID INT NOT NULL,
  Emp_date_sortie DATE NOT NULL,
  Emp_Nom Varchar(55) NOT NULL, 
  Emp_Num_Secu_Sociale INT NOT NULL,
  Emp_Prenom Varchar (55) NOT NULL,
  Emp_Sexe Varchar (1) NOT NULL,
  Emp_Date_De_Naissance DATE NOT NULL,
  Emp_Adresse Varchar (55) NOT NULL,
  Emp_Adresse_Suite Varchar(55) NOT NULL,
  Emp_Cp INT NOT NULL,
  Emp_Ville Varchar(30) NOT NULL,
  Emp_Telephone INT NOT NULL,
  Emp_Mail Varchar(60) NOT NULL,
  Emp_Type_Client BIT NOT NULL,
  Emp_MotDePasse Varchar(30) NOT NULL,
  Emp_Login Varchar(30) NOT NULL,
  Emp_Parent INT null,
  FOREIGN KEY(Pos_Id) REFERENCES Poste(Pos_Id),
  Constraint FK_Employe_Employe FOREIGN KEY(Emp_Parent) References Employe(Emp_ID));

  CREATE TABLE Fournisseur (
  Four_ID INT NOT NULL PRIMARY KEY,
  Four_nom Varchar (50) NOT NULL,
  Four_Adresse Varchar (255) NOT NULL,
  Four_Adresse_Suite Varchar (255) NOT NULL,
  Four_CP INT NOT NULL,
  Four_Ville Varchar (255)  NOT NULL,
  Four_Telephone INT NOT NULL,
  Four_Mail Varchar (255) NOT NULL,
  );

  CREATE TABLE Produit (
  Pro_ID INT NOT NULL PRIMARY KEY,
  Pro_Libelle Varchar (50) NOT NULL,
  Pro_Prix DECIMAL (7,2) NOT NULL,
  Pro_Ref varchar (50) NOT NULL,
  Pro_Stock INT NOT NULL,
  Pro_Stock_Alerte INT NOT NULL,
  Pro_couleur Varchar (100) NOT NULL,
  Pro_Photo Varchar (255) NOT NULL,
  Pro_Date_Ajout DATE NOT NULL,
  Pro_Date_Modif DATETIME2,
  Pro_Bloque BIT NOT NULL
  );

  CREATE TABLE Commande (
  Com_ID INT NOT NULL PRIMARY KEY,
  Com_Ref Varchar(50) NOT NULL,
  Com_Remise DECIMAL (7,2) NOT NULL,
  Com_Date DATE NOT NULL,
  Com_Mode_Paiement Varchar(255) NOT NULL,
  Com_Date_reglement DATE NOT NULL,
  Com_Date_Paiement DATE NOT NULL,
  Com_status Varchar(255) NOT NULL,
  );

  Create TABLE Suivre (
  Cli_ID INT NOT NULL,
  Emp_ID INT NOT NULL,
  PRIMARY KEY(Cli_Id, Emp_Id),
  FOREIGN KEY(Cli_Id) REFERENCES Client(Cli_Id),
  FOREIGN KEY(Emp_Id) REFERENCES Employe(Emp_Id)
  );


  CREATE TABLE LigneCommande (
  Lig_ID INT NOT NULL PRIMARY KEY,
  Lig_Quantite INT NOT NULL,
  Lig_Remise Varchar(255) NOT NULL,
  FOREIGN KEY(Lig_Id) REFERENCES Produit(Pro_Id),
  FOREIGN KEY(Lig_Id) REFERENCES Commande(Com_Id),
  );

  CREATE TABLE Livraison (
  Liv_Id INT NOT NULL PRIMARY KEY,
  Liv_D_Reelle DATE NOT NULL,
  Liv_D_Expedition DATE NOT NULL,
  Liv_D_Preparation DATE NOT NULL,
  FOREIGN KEY(Liv_Id) REFERENCES Commande(Com_Id),
  );

  CREATE TABLE Contenir (
  Lig_Id INT,
  Liv_Id INT,
  Quantité INT
  PRIMARY KEY(Lig_Id,Liv_Id)
  FOREIGN KEY(Lig_Id) REFERENCES ligneCommande(Lig_Id),
  FOREIGN KEY(Liv_Id) REFERENCES Livraison(Liv_Id)

  );
  