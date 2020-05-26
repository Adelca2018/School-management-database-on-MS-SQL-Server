USE [Schulnotenverwaltung_Draft]
GO

  -----
-- Diese Befehle testen die Prozedure. Immer ein Sequenze von Befehle auskommentieren vor dem Ausf�hren
  -------
DECLARE @Erfolg AS bit;
DECLARE @Feedback AS VARCHAR(MAX);

-- Datum testen  schon gut
--EXEC [dbo].[sp_Add_Schuler] 
--'Feunou' ,--@Sch�ler_Name nchar(30),
-- 'Adeline',--@Sch�ler_Vorname nchar(20),
-- 2,--@Sch�ler_Geschlecht_ID int,
-- '30.04.2020',-- @Sch�ler_Geburtstag date,
-- Blumenstrasse,--@Sch�ler_Adresse_Strasse nchar(50),
-- 4,--@Sch�ler_Adresse_H_Nr int,
-- 79312,--@Sch�ler_Adresse_PLZ nchar(10),
-- Freiburg,--@Sch�ler_Adresse_Ort nchar(30),
---- 2020,--@Sch�ler_Schulbeginn int,-- = YEAR(GETDATE()),
--@Erfolg OUTPUT, -- geklappt oder nicht
--@Feedback OUTPUT;

-- Pr�fen ob Sculer schon in der Schule existiert.  Gut

--EXEC [dbo].[sp_Add_Schuler] 
--'Reiter' ,--@Sch�ler_Name nchar(30),
-- 'Michael',--@Sch�ler_Vorname nchar(20),
-- 1,--@Sch�ler_Geschlecht_ID int,
-- '01.10.2010',-- @Sch�ler_Geburtstag date,
-- Blumenstrasse,--@Sch�ler_Adresse_Strasse nchar(50),
-- 4,--@Sch�ler_Adresse_H_Nr int,
-- 79312,--@Sch�ler_Adresse_PLZ nchar(10),
-- Freiburg,--@Sch�ler_Adresse_Ort nchar(30),
-- --2020,--@Sch�ler_Schulbeginn int,-- = YEAR(GETDATE()),
--@Erfolg OUTPUT, -- geklappt oder nicht
--@Feedback OUTPUT;


	
-- Test INSERT neuer Sch�ler

EXEC [dbo].[sp_Add_Schuler] 
'Feunou' ,--@Sch�ler_Name nchar(30),
 'Adeline',--@Sch�ler_Vorname nchar(20),
 2,--@Sch�ler_Geschlecht_ID int,
 '30.04.2015',-- @Sch�ler_Geburtstag date,
 Blumenstrasse,--@Sch�ler_Adresse_Strasse nchar(50),
 4,--@Sch�ler_Adresse_H_Nr int,
 79312,--@Sch�ler_Adresse_PLZ nchar(10),
 Freiburg,--@Sch�ler_Adresse_Ort nchar(30),
-- 2020,--@Sch�ler_Schulbeginn int,-- = YEAR(GETDATE()),
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


SELECT @Erfolg AS 'Geklappt?', @Feedback AS 'R�ckgabemeldung';