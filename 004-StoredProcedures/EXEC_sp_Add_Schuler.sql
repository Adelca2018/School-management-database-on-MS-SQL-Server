USE [Schulnotenverwaltung_Draft]
GO

  -----
-- Diese Befehle testen die Prozedure. Immer ein Sequenze von Befehle auskommentieren vor dem Ausführen
  -------
DECLARE @Erfolg AS bit;
DECLARE @Feedback AS VARCHAR(MAX);

-- Datum testen  schon gut
--EXEC [dbo].[sp_Add_Schuler] 
--'Feunou' ,--@Schüler_Name nchar(30),
-- 'Adeline',--@Schüler_Vorname nchar(20),
-- 2,--@Schüler_Geschlecht_ID int,
-- '30.04.2020',-- @Schüler_Geburtstag date,
-- Blumenstrasse,--@Schüler_Adresse_Strasse nchar(50),
-- 4,--@Schüler_Adresse_H_Nr int,
-- 79312,--@Schüler_Adresse_PLZ nchar(10),
-- Freiburg,--@Schüler_Adresse_Ort nchar(30),
---- 2020,--@Schüler_Schulbeginn int,-- = YEAR(GETDATE()),
--@Erfolg OUTPUT, -- geklappt oder nicht
--@Feedback OUTPUT;

-- Prüfen ob Sculer schon in der Schule existiert.  Gut

--EXEC [dbo].[sp_Add_Schuler] 
--'Reiter' ,--@Schüler_Name nchar(30),
-- 'Michael',--@Schüler_Vorname nchar(20),
-- 1,--@Schüler_Geschlecht_ID int,
-- '01.10.2010',-- @Schüler_Geburtstag date,
-- Blumenstrasse,--@Schüler_Adresse_Strasse nchar(50),
-- 4,--@Schüler_Adresse_H_Nr int,
-- 79312,--@Schüler_Adresse_PLZ nchar(10),
-- Freiburg,--@Schüler_Adresse_Ort nchar(30),
-- --2020,--@Schüler_Schulbeginn int,-- = YEAR(GETDATE()),
--@Erfolg OUTPUT, -- geklappt oder nicht
--@Feedback OUTPUT;


	
-- Test INSERT neuer Schüler

EXEC [dbo].[sp_Add_Schuler] 
'Feunou' ,--@Schüler_Name nchar(30),
 'Adeline',--@Schüler_Vorname nchar(20),
 2,--@Schüler_Geschlecht_ID int,
 '30.04.2015',-- @Schüler_Geburtstag date,
 Blumenstrasse,--@Schüler_Adresse_Strasse nchar(50),
 4,--@Schüler_Adresse_H_Nr int,
 79312,--@Schüler_Adresse_PLZ nchar(10),
 Freiburg,--@Schüler_Adresse_Ort nchar(30),
-- 2020,--@Schüler_Schulbeginn int,-- = YEAR(GETDATE()),
@Erfolg OUTPUT, -- geklappt oder nicht
@Feedback OUTPUT;


-- Test UPDATE --
--EXEC [dbo].[sp_AddProjektPersonZeit] 
--	70, --@ProjectID -- Abendkleid
--	9, --@PersonalID -- Saint Maurent
--	'20.04.2020', -- 
--	4, --@PP_Zeit -- 
--	'Test UPDATE', --@Kommentar
--	@Erfolg OUTPUT,
--	@Feedback OUTPUT;


SELECT @Erfolg AS 'Geklappt?', @Feedback AS 'Rückgabemeldung';