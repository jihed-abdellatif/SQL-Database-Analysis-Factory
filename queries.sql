-- Requêtes SQL pour l'Analyse de Production
-- Auteur : Jihed Abdellatif
-- Objectif : Extraire des insights pour améliorer la performance de l'usine

-- ========================================
-- QUESTION 1 : Quelle machine produit le plus ?
-- ========================================
SELECT 
    M.Nom AS Machine,
    SUM(P.Quantite) AS Production_Totale
FROM Production P
INNER JOIN Machines M ON P.Machine_ID = M.Machine_ID
GROUP BY M.Nom
ORDER BY Production_Totale DESC;

-- ========================================
-- QUESTION 2 : Quelle machine tombe le plus en panne ?
-- ========================================
SELECT 
    M.Nom AS Machine,
    COUNT(Pa.Panne_ID) AS Nombre_Pannes,
    SUM(Pa.Duree_heures) AS Duree_Totale_Pannes_h
FROM Pannes Pa
INNER JOIN Machines M ON Pa.Machine_ID = M.Machine_ID
GROUP BY M.Nom
ORDER BY Nombre_Pannes DESC;

-- ========================================
-- QUESTION 3 : Production par type de machine
-- ========================================
SELECT 
    M.Type,
    SUM(P.Quantite) AS Production_Totale
FROM Production P
INNER JOIN Machines M ON P.Machine_ID = M.Machine_ID
GROUP BY M.Type
ORDER BY Production_Totale DESC;

-- ========================================
-- QUESTION 4 : Machines avec plus de 2 pannes
-- (Utilisation de HAVING)
-- ========================================
SELECT 
    M.Nom AS Machine,
    COUNT(Pa.Panne_ID) AS Nombre_Pannes
FROM Pannes Pa
INNER JOIN Machines M ON Pa.Machine_ID = M.Machine_ID
GROUP BY M.Nom
HAVING COUNT(Pa.Panne_ID) > 1
ORDER BY Nombre_Pannes DESC;

-- ========================================
-- QUESTION 5 : Taux de disponibilité des machines
-- (Calcul : 100% - (Durée Pannes / Temps Total))
-- Hypothèse : 1 mois = 720 heures
-- ========================================
SELECT 
    M.Nom AS Machine,
    IFNULL(SUM(Pa.Duree_heures), 0) AS Heures_Panne,
    ROUND(100 - (IFNULL(SUM(Pa.Duree_heures), 0) / 720 * 100), 2) AS Taux_Disponibilite_Pourcent
FROM Machines M
LEFT JOIN Pannes Pa ON M.Machine_ID = Pa.Machine_ID
GROUP BY M.Nom
ORDER BY Taux_Disponibilite_Pourcent ASC;

-- ========================================
-- QUESTION 6 : Production journalière moyenne
-- ========================================
SELECT 
    Date,
    SUM(Quantite) AS Production_Totale_Jour
FROM Production
GROUP BY Date
ORDER BY Date;
