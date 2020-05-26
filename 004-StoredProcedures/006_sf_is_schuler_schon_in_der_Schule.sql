

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

  --  Diese Funktion gibt die Note einer Sch�ler in eimem Fach
  -- in einem bestimmten Klasse
  --------------------------

CREATE FUNCTION [dbo].[sf_is_schuler_schon_in_der_Schule] 
(
	 @Sch�ler_Name nchar(30),
     @Sch�ler_Vorname nchar(20),
     @Sch�ler_Geschlecht_ID int,
     @Sch�ler_Geburtstag date
    
	
)
RETURNS int
AS
BEGIN
	DECLARE @value int;
		
	SELECT @value=count (*)
	FROM dbo.tb_Sch�ler
	 WHERE Sch�ler_Name= @Sch�ler_Name
	AND Sch�ler_Vorname= @Sch�ler_Vorname 
	AND Sch�ler_Geschlecht_ID=@Sch�ler_Geschlecht_ID
	AND Sch�ler_Geburtstag=@Sch�ler_Geburtstag;
	IF @value>0 
	Set @value=1;
	ELSE
	Set @value=0;

	RETURN  @value;
END
GO