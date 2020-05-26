USE [Schulnotenverwaltung_Draft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Adeline Makoudjou
-- Create date: 27.04.2020
-- Description:	gibt alle die schüler einer Klasse in einem Schuljahr
-- =============================================
DROP FUNCTION IF EXISTS [dbo].[tf_alle_Schuler_Klasse_schuljahr] ;
GO

CREATE FUNCTION [dbo].[tf_alle_Schuler_Klasse_schuljahr] 
(		
	@Klassen_ID int, 
	@Schuljahr nvarchar(9)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here

	SELECT Schüler_Name , Schüler_Vorname, G.Geschlecht_Bezeichnung, S.Schüler_Geburtstag
	FROM dbo.tb_Schüler S INNER JOIN 
	dbo.Geschlecht G ON S.Schüler_Geschlecht_ID=G.Geschlecht_ID	
	INNER JOIN dbo.tb_Verbindung_Schueler_Klasse V on V.Schüler_ID=S.Schüler_ID
	Where (V.Klassen_ID=@Klassen_ID  AND V.Schuljahr like @Schuljahr)

)
GO
