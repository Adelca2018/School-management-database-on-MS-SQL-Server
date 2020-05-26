USE [Schulnotenverwaltung_Draft]
GO

-------------------------------------------------------------------------------------------------
-- Abfrage 2: Auswahl der Schüler, die in 2020 ihre Schulform abschließen, sortiert nach Nachname
-- Sicht "Liste_Schüler_Abschlussjahr2020"
-------------------------------------------------------------------------------------------------

SELECT	 [Schüler_Name] AS Nachname
		,[Schüler_Vorname] AS Vorname
		,[Schüler_Adresse_Strasse] AS Strasse
		,[Schüler_Adresse_H_Nr] AS Hausnr
		,[Schüler_Adresse_PLZ] AS PLZ
		,[Schüler_Adresse_Ort] AS Ort
		,((year(GETDATE())*12*31+month(GETDATE())*31+day(GETDATE()))
			-(year(Schüler_Geburtstag)*12*31+month(Schüler_Geburtstag)*31+day(Schüler_Geburtstag)))/(12*31) AS 'Alter'
		,[Schüler_Geschlecht_ID] AS Geschlecht
FROM [Schulnotenverwaltung_Draft].[dbo].[tb_Schüler]
WHERE [Schüler_Abschlussjahrgang] = '2020'
ORDER BY [Schüler_Name]


--CREATE VIEW [dbo].[Liste_Schüler_Abschlussjahr2020]
--AS
--SELECT	Schüler_Name AS Nachname
--		, Schüler_Vorname AS Vorname
--		, Schüler_Adresse_Strasse AS Straße
--		, Schüler_Adresse_H_Nr AS Hausnr
--		, Schüler_Adresse_PLZ AS PLZ
--		, Schüler_Adresse_Ort AS Ort
--		, Schüler_Geburtstag AS Geburtsdatum
--		, Schüler_Geschlecht_ID AS Geschlecht
--FROM    dbo.tb_Schüler
--WHERE   (Schüler_Abschlussjahrgang = 2020)
--GO
