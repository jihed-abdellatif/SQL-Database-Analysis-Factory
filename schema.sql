-- Base de Données : Usine de Production
-- Auteur : Jihed Abdellatif
-- Date : Avril 2025

-- Table 1 : Machines
CREATE TABLE Machines (
    Machine_ID INT PRIMARY KEY,
    Nom VARCHAR(50),
    Type VARCHAR(30)
);

-- Insertion de données exemple
INSERT INTO Machines (Machine_ID, Nom, Type) VALUES
(1, 'Presse A', 'Découpe'),
(2, 'Presse B', 'Découpe'),
(3, 'Robot Soudure', 'Assemblage'),
(4, 'Convoyeur', 'Transport');

-- Table 2 : Production
CREATE TABLE Production (
    Production_ID INT PRIMARY KEY,
    Machine_ID INT,
    Quantite INT,
    Date DATE,
    FOREIGN KEY (Machine_ID) REFERENCES Machines(Machine_ID)
);

-- Insertion de données exemple
INSERT INTO Production (Production_ID, Machine_ID, Quantite, Date) VALUES
(1, 1, 150, '2024-01-10'),
(2, 1, 200, '2024-01-11'),
(3, 2, 180, '2024-01-10'),
(4, 3, 90, '2024-01-10'),
(5, 3, 120, '2024-01-11');

-- Table 3 : Pannes
CREATE TABLE Pannes (
    Panne_ID INT PRIMARY KEY,
    Machine_ID INT,
    Duree_heures INT,
    Date DATE,
    FOREIGN KEY (Machine_ID) REFERENCES Machines(Machine_ID)
);

-- Insertion de données exemple
INSERT INTO Pannes (Panne_ID, Machine_ID, Duree_heures, Date) VALUES
(1, 1, 2, '2024-01-10'),
(2, 3, 5, '2024-01-11'),
(3, 3, 3, '2024-01-12');
