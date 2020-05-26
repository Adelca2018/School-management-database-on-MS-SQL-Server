

USE [Schulnotenverwaltung_Draft]
GO

/****** Object:  UserDefinedFunction [dbo].[sf_Count_Records_Pers_Date_Project]    Script Date: 27.04.2020 11:44:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
  

 DROP FUNCTION IF EXISTS [dbo].[sf_is_schuler_schon_in_der_Schule] ;
GO


  -------------------

  --  Diese Funktion gibt die Note einer Schüler in eimem Fach
  -- in einem bestimmten Klasse
  --------------------------

CREATE FUNCTION [dbo].[sf_is_schuler_schon_in_der_Schule] 
(
	 @Schüler_Name nchar(30),
     @Schüler_Vorname nchar(20),
     @Schüler_Geschlecht_ID int,
     @Schüler_Geburtstag date
    
	
)
RETURNS int
AS
BEGIN
	DECLARE @value int;
		
	SELECT @value=count (*)
	FROM dbo.tb_Schüler
	 WHERE Schüler_Name= @Schüler_Name
	AND Schüler_Vorname= @Schüler_Vorname 
	AND Schüler_Geschlecht_ID=@Schüler_Geschlecht_ID
	AND Schüler_Geburtstag=@Schüler_Geburtstag;
	IF @value>0 
	Set @value=1;
	ELSE
	Set @value=0;

	RETURN  @value;
END
GO