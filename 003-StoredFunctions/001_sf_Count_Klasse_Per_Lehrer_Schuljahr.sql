USE [Schulnotenverwaltung_Draft]
GO

/****** Object:  UserDefinedFunction [dbo].[sf_Count_Records_Pers_Date_Project]    Script Date: 27.04.2020 11:44:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
  
  
   DROP FUNCTION IF EXISTS [dbo].[sf_Count_Klasse_Per_Lehrer_Schuljah] ;
GO


  -------------------

  --  Diese Funktion zeigt die Zahl von Klasse, die ein Lehrer 
  --ein Schuljahr unterrichtet hat

  --------------------------

CREATE FUNCTION [dbo].[sf_Count_Klasse_Per_Lehrer_Schuljahr] 
(
	@Mitarbeiter_ID int,	
	@Schuljahr nvarchar(9)
	
)
RETURNS int
AS
BEGIN
	DECLARE @CountOfRecords int;
	SELECT @CountOfRecords = COUNT(distinct Klassen_ID)
	FROM dbo.tb_Verbindung_Lehrer_Klasse_Schuljahr
	WHERE Mitarbeiter_ID = @Mitarbeiter_ID
	AND Schuljahr = @Schuljahr  ;

	RETURN @CountOfRecords;
END
GO