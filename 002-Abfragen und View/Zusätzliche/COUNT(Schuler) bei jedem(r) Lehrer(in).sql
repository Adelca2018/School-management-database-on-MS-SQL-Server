USE [Schulnotenverwaltung_Draft]
SELECT COUNT(tb_Verbindung_Schueler_Klasse.Schueler_ID) AS "Anzahl_Schülern",
	   [tb_Verbindung_Lehrer_Klasse_Schuljahr].Mitarbeiter_ID 
FROM tb_Verbindung_Schueler_Klasse
INNER JOIN [tb_Klassen] ON tb_Verbindung_Schueler_Klasse.Klassen_ID = [tb_Klassen].Klassen_ID
INNER JOIN [tb_Verbindung_Lehrer_Klasse_Schuljahr] ON tb_Verbindung_Schueler_Klasse.Klassen_ID = [tb_Verbindung_Lehrer_Klasse_Schuljahr].Klassen_ID
GROUP BY [tb_Verbindung_Lehrer_Klasse_Schuljahr].Mitarbeiter_ID 




