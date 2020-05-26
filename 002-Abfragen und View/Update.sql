USE [Schulnotenverwaltung_Draft]
GO

-- Feststellung, dass Raumnummern eingegeben wurden, die nicht existieren.
-- Die Raumnummern wurden korrigiert

UPDATE dbo.tb_Ergebnisse
SET Raum_ID = 12
WHERE Raum_ID = 10;

UPDATE dbo.tb_Ergebnisse
SET Raum_ID = 13
WHERE Raum_ID = 11


-- Feststellung, dass beim Direktor irrtümlich eine Schulform erfasst wurde
-- Die Info wird gelöscht

UPDATE dbo.tb_Mitarbeiter
SET Schulform_ID = NULL
WHERE Mitarbeiter_Funktion = 'Direktor';
