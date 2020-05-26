USE [Schulnotenverwaltung_Draft]
GO

-------------------------------------------------------------------------------------------------
-- Abfrage 2: Auswahl der Sch�ler, die in 2020 ihre Schulform abschlie�en, sortiert nach Nachname
-- Sicht "Liste_Sch�ler_Abschlussjahr2020"
-------------------------------------------------------------------------------------------------

SELECT	 [Sch�ler_Name] AS Nachname
		,[Sch�ler_Vorname] AS Vorname
		,[Sch�ler_Adresse_Strasse] AS Strasse
		,[Sch�ler_Adresse_H_Nr] AS Hausnr
		,[Sch�ler_Adresse_PLZ] AS PLZ
		,[Sch�ler_Adresse_Ort] AS Ort
		,((year(GETDATE())*12*31+month(GETDATE())*31+day(GETDATE()))
			-(year(Sch�ler_Geburtstag)*12*31+month(Sch�ler_Geburtstag)*31+day(Sch�ler_Geburtstag)))/(12*31) AS 'Alter'
		,[Sch�ler_Geschlecht_ID] AS Geschlecht
FROM [Schulnotenverwaltung_Draft].[dbo].[tb_Sch�ler]
WHERE [Sch�ler_Abschlussjahrgang] = '2020'
ORDER BY [Sch�ler_Name]


--CREATE VIEW [dbo].[Liste_Sch�ler_Abschlussjahr2020]
--AS
--SELECT	Sch�ler_Name AS Nachname
--		, Sch�ler_Vorname AS Vorname
--		, Sch�ler_Adresse_Strasse AS Stra�e
--		, Sch�ler_Adresse_H_Nr AS Hausnr
--		, Sch�ler_Adresse_PLZ AS PLZ
--		, Sch�ler_Adresse_Ort AS Ort
--		, Sch�ler_Geburtstag AS Geburtsdatum
--		, Sch�ler_Geschlecht_ID AS Geschlecht
--FROM    dbo.tb_Sch�ler
--WHERE   (Sch�ler_Abschlussjahrgang = 2020)
--GO
