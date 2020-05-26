USE [Schulnotenverwaltung_Draft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Adeline Makoudjou
-- Create date: 27.04.2020
-- Description:	gibt alle die sch�ler einer Klasse in einem Schuljahr
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

	SELECT Sch�ler_Name , Sch�ler_Vorname, G.Geschlecht_Bezeichnung, S.Sch�ler_Geburtstag
	FROM dbo.tb_Sch�ler S INNER JOIN 
	dbo.Geschlecht G ON S.Sch�ler_Geschlecht_ID=G.Geschlecht_ID	
	INNER JOIN dbo.tb_Verbindung_Schueler_Klasse V on V.Sch�ler_ID=S.Sch�ler_ID
	Where (V.Klassen_ID=@Klassen_ID  AND V.Schuljahr like @Schuljahr)

)
GO
