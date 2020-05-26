USE [Schulnotenverwaltung_Draft]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


DROP FUNCTION IF EXISTS [dbo].[tfms_Noten_Schuler_Klasse_Fach_schuljahr] ;
GO 

-- =============================================
-- Author:		Adeline Makoudjou
-- Create date: 27.04.2020
-- Description:	gibt alle die Noten allen sch�ler einer 
--Klasse in einem Schuljahr f�r ein bestimmstes Schulfach

-- Benutzt unsere eigene Funktion dbo.[sf_Note_Schuler_Fach_Klasse] (sehe datei '001-01_sf_Note_Schuler_Fach_Klasse' in Ordner)
-- um die Note f�r jeden Schuler zu berechnen

-- =============================================
CREATE FUNCTION [dbo].[tfms_Noten_Schuler_Klasse_Fach_schuljahr] 
(
	@Klassen_ID int, 
	@Schuljahr nvarchar(9),
	@Schulfach_ID int
)

RETURNS 
@Note_alle_Schuler_Schulfach_Klasse_schuljahr TABLE  
(
    Sch�ler_ID int,
	Sch�ler_Name NVARCHAR(30),
	Sch�ler_Vorname NVARCHAR(20),
	Note int
	
)
AS
BEGIN
	DECLARE @Sch�ler_Name NVARCHAR(30);
	DECLARE @Sch�ler_Vorname NVARCHAR(20);
	DECLARE @Note int;
	DECLARE @Sch�ler_ID int;
--	DECLARE @Sch�ler_Geschlecht nchar(10);
	-------------------------------
	DECLARE db_cursor CURSOR FOR
	SELECT Sch�ler_ID,Sch�ler_Name , Sch�ler_Vorname
	FROM tf_alle_Schuler_Klasse_schuljahr (@Klassen_ID,@Schuljahr)
	
		OPEN db_cursor;
		FETCH NEXT FROM db_cursor -- go to record 1
		INTO @Sch�ler_ID, @Sch�ler_Name, @Sch�ler_Vorname;
		WHILE @@FETCH_STATUS = 0 
		BEGIN			
			SET @Note= 
				dbo.[sf_Note_Schuler_Fach_Klasse] (@Sch�ler_ID, @Klassen_ID,@Schulfach_ID);
			-- Tabelle f�llen --
			INSERT INTO @Note_alle_Schuler_Schulfach_Klasse_schuljahr
			VALUES(@Sch�ler_ID, @Sch�ler_Name, @Sch�ler_Vorname, @Note);
			FETCH NEXT FROM db_cursor -- go to next record
			INTO @Sch�ler_ID, @Sch�ler_Name, @Sch�ler_Vorname;
		END	
	CLOSE db_cursor  
	DEALLOCATE db_cursor
	--------------------------------		
	RETURN 
END
GO




