USE [Schulnotenverwaltung_Draft]
GO
/****** Object:  StoredProcedure [dbo].[sp_Add_Schuler]    Script Date: 29/04/2020 10:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sp_Add_Schuler] 

 @Schüler_Name nchar(30),
 @Schüler_Vorname nchar(20),
 @Schüler_Geschlecht_ID int,
 @Schüler_Geburtstag date,
 @Schüler_Adresse_Strasse nchar(50),
 @Schüler_Adresse_H_Nr int,
 @Schüler_Adresse_PLZ nchar(10),
 @Schüler_Adresse_Ort nchar(30),


	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN

	DECLARE @Schüler_Schulbeginn int;
	SET @Schüler_Schulbeginn=Convert(int,Year(GETDATE()));
	SET @Erfolg = 1;
	SET @Feedback = 'Alles OK!';
	DECLARE @msg AS varchar(MAX);
	-------------------------------------------------------------------
	
	BEGIN TRY 
		-- Geburtsdatum testen (nicht Zukunft)
		IF @Schüler_Geburtstag  >= GETDATE()
			THROW 50001, 'Falsches Geburtsdatum, bitte korrigieren!', 1;		
			
		--Prüfen ob Adressnummer gut eingegeben wurde
		IF @Schüler_Adresse_H_Nr<=0
		   THROW 50002, 'Falsches Straßenummer, bitte korrigieren!', 1; 

		   -- Prüfen ob Schüler schon in der Schule aufgezeichnet ist
		IF dbo.sf_is_schuler_schon_in_der_Schule( @Schüler_Name, @Schüler_Vorname, @Schüler_Geschlecht_ID, @Schüler_Geburtstag) = 1
			THROW 50003, 'Dieser Schüler/in schon existiert in der Schule, bitte korrigieren!', 1;
			

					
			INSERT INTO dbo.tb_Schüler 
				   (Schüler_Name,Schüler_Vorname,Schüler_Geschlecht_ID,Schüler_Geburtstag,Schüler_Adresse_Strasse,
                    Schüler_Adresse_H_Nr, Schüler_Adresse_PLZ, Schüler_Adresse_Ort,Schüler_Schulbeginn )
			VALUES (@Schüler_Name,@Schüler_Vorname,@Schüler_Geschlecht_ID,@Schüler_Geburtstag,@Schüler_Adresse_Strasse,
                    @Schüler_Adresse_H_Nr, @Schüler_Adresse_PLZ, @Schüler_Adresse_Ort,@Schüler_Schulbeginn);

			SET @Feedback = '1 Schuler hinzugefügt';
		
	
	END TRY 
	BEGIN CATCH
   
		SET @Erfolg = 0; -- nicht geklappt--
		SET @Feedback = 
			'Fehler Nr. ' + CONVERT(varchar, ERROR_NUMBER()) + ' ' +
			ERROR_MESSAGE();
	END CATCH;    
END
