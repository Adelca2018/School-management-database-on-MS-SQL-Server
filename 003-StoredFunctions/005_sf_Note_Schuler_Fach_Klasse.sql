USE [Schulnotenverwaltung_Draft]
GO

/****** Object:  UserDefinedFunction [dbo].[sf_Count_Records_Pers_Date_Project]    Script Date: 27.04.2020 11:44:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
  

 DROP FUNCTION IF EXISTS [dbo].[sf_Note_Schuler_Fach_Klasse] ;
GO


  -------------------

  --  Diese Funktion gibt die Note einer Sch�ler in eimem Fach
  -- in einem bestimmten Klasse
  --------------------------

CREATE FUNCTION [dbo].[sf_Note_Schuler_Fach_Klasse] 
(
	@Sch�ler_ID int,	
	@Klassen_ID int, 
	@Schulfach_ID int
	
)
RETURNS int
AS
BEGIN
	DECLARE @Note int;
		
	SELECT @Note=avg (Note)
	FROM dbo.tb_Ergebnisse
	WHERE Sch�ler_ID= @Sch�ler_ID
	AND Klassen_ID = @Klassen_ID 
	AND Schulfach_ID=@Schulfach_ID
		
	RETURN @Note;
END
GO