USE [Schulnotenverwaltung_Draft]
GO

/****** Object:  View [dbo].[Übersicht_Anzahl_aller_Schüler_pro_Schulform]    Script Date: 29/04/2020 09:30:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[Übersicht_Anzahl_aller_Schüler_pro_Schulform] AS
SELECT COUNT(tb_Verbindung_Schueler_Klasse.Schüler_ID) AS "Anzahl Schuler", 
	[Schulform_Qualifikation].Schulform_Bezeichnung
FROM tb_Verbindung_Schueler_Klasse
JOIN  tb_Klassen ON tb_Verbindung_Schueler_Klasse.Klassen_ID = tb_Klassen.Klassen_ID
JOIN [Schulform_Qualifikation] ON tb_Klassen.[Schulform_ID] = Schulform_Qualifikation.Schulform_ID
WHERE tb_Verbindung_Schueler_Klasse.Schuljahr = '2019-2020'
	GROUP BY [Schulform_Qualifikation].Schulform_Bezeichnung;
GO


