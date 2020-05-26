USE [Schulnotenverwaltung_Draft]

SELECT COUNT(tb_Verbindung_Schueler_Klasse.Schueler_ID) AS "Anzahl_Schülern", [tb_Klassen].Klassen_Stufe
FROM tb_Verbindung_Schueler_Klasse
JOIN [tb_Klassen]
	ON tb_Verbindung_Schueler_Klasse.Klassen_ID = [tb_Klassen].Klassen_ID
	GROUP BY [tb_Klassen].Klassen_Stufe;
	