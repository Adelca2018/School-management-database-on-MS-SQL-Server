USE [Schulnotenverwaltung_Draft]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Adeline Makoudjou
-- Create date: 29.04.2020
-- Description:	Dies Trigger testet, wenn ein neuer Datensatz in tb_Ergebnisse hingefügt wird,
-------------- dass es noch nicht diese Note existiert. Falls der Datensazt schon da war dann ist eine Meldung
-------------- geschrieben
-- =============================================
DROP TRIGGER IF EXISTS [dbo].[tr_Ergebnisse_INSERT_Test]
GO

CREATE TRIGGER [dbo].[tr_Ergebnisse_INSERT_Test] 
   ON [tb_Ergebnisse]    
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
	
	DECLARE @Ergebnis_Datum date;
	DECLARE @Schüler_ID     int;
    DECLARE @Schulfach_ID int;
    DECLARE @Aufgabenart_ID   int;
    DECLARE @Klassen_ID   int;
	


	SELECT @Schulfach_ID = Schulfach_ID  FROM inserted;
	SELECT @Schüler_ID = Schüler_ID FROM inserted;
	SELECT @Ergebnis_Datum = Ergebnis_Datum FROM inserted;
	SELECT @Klassen_ID  = Klassen_ID  FROM inserted;
	SELECT @Aufgabenart_ID  = Aufgabenart_ID FROM inserted;

	DECLARE @count smallint;

	SELECT  @count= Count(*)
	FROM dbo.tb_Ergebnisse 
	Where (Schulfach_ID = @Schulfach_ID AND Schüler_ID = @Schüler_ID AND Ergebnis_Datum = @Ergebnis_Datum
	        AND Klassen_ID  = @Klassen_ID AND Aufgabenart_ID  = @Aufgabenart_ID);

	----- Wenn @count>0 dann ist disen Datensatz schon da
	
		IF (@count>0)
	BEGIN
						
		DECLARE @schuler_name nvarchar(50);
		DECLARE @schulfach_name  nvarchar(50);
		DECLARE @Aufgabenart    nvarchar(50);
		
		SELECT @schuler_name  = dbo.tb_Schüler.Schüler_Name
		FROM dbo.tb_Schüler
		WHERE Schüler_ID = @Schüler_ID;
		
		SELECT @schulfach_name  = dbo.tb_Schulfächer.Schulfach_Bezeichnung
		FROM dbo.tb_Schulfächer
		WHERE Schulfach_ID = @Schulfach_ID; 

		SELECT @Aufgabenart  = dbo.tb_Aufgabenarten.Aufgabenart_Bezeichnung
		FROM dbo.tb_Aufgabenarten
		WHERE Aufgabenart_ID  = @Aufgabenart_ID;

		DECLARE @Monat int;
		SET @Monat = MONTH(@Ergebnis_Datum );
		DECLARE @Jahr int;
		SET @Jahr = YEAR(@Ergebnis_Datum);
		
		DECLARE @Tag int;
		SET @TAg = DAY(@Ergebnis_Datum );

		DECLARE @msg AS varchar(MAX);
		SET @msg = 
		FORMATMESSAGE('Es gibt schon eine Note für Schüler %s für Schulfach  %s für  Aufgabenart %s für  Klasse %i im Tag %i Monat %i Jahr
		%i. Bitte überprüfen!', 
		@schuler_name , @schulfach_name, @Aufgabenart, @Klassen_ID,@Tag, @Monat, @Jahr);
		
		
		INSERT INTO dbo.Ergebnisse_Meldungen
					(Mode, Meldung)
					VALUES ('I', @msg);	
	END


END
GO
