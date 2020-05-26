USE [Schulnotenverwaltung_Draft]
GO

---------------------------------------------------------------------------------------------
-- Abfrage 1: Auswahl der Lehrer aus den Mitarbeitern, sortiert nach Schulform und Nachname
-- Sicht dazu "Liste_Lehrer_Schulform"
---------------------------------------------------------------------------------------------

SELECT	 [Schulform_ID] AS Schulform
		,[Mitarbeiter_Personalnummer] AS Personalnummer
		,[Mitarbeiter_Nachname] AS Nachname
		,[Mitarbeiter_Vorname] AS Vorname
FROM [Schulnotenverwaltung_Draft].[dbo].[tb_Mitarbeiter]
WHERE [Mitarbeiter_Funktion] = 'Lehrer'
ORDER BY [Schulform_ID], [Mitarbeiter_Nachname];


--CREATE VIEW [dbo].[Liste_Lehrer_Schulform]
--AS
--SELECT	Schulform_ID AS Schulform
--		, Mitarbeiter_Personalnummer AS Personalnummer
--		, Mitarbeiter_Nachname AS Nachname
--		, Mitarbeiter_Vorname AS Vorname
--FROM    dbo.tb_Mitarbeiter
--WHERE   (Mitarbeiter_Funktion = N'Lehrer')
--GO
