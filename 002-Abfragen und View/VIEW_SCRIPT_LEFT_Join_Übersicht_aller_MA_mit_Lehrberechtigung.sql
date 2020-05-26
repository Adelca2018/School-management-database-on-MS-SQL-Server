
-----------------ABFRAGE BESCHREIBUNG-----------------------------
--
-- Diese Abfrage zeigt alle Mitarbeiter unabhängig davon ob sie Lehrer sind oder nicht
 --und für diejenige, die Lehrer sind die Schulfächer, die sie beibringen können

------------------------------------------------------------------



USE [Schulnotenverwaltung_Draft]
GO


CREATE VIEW [Übersicht_Lehrer_Schulform_Schulfach] AS
		SELECT M.Mitarbeiter_Vorname, M.Mitarbeiter_Nachname, M.Mitarbeiter_Funktion, Q.Schulform_Bezeichnung as Qualifikation, F.Schulfach_Bezeichnung
		FROM [tb_Mitarbeiter] M LEFT JOIN [Schulform_Qualifikation] Q 
		ON  M.Schulform_ID=Q.Schulform_ID LEFT JOIN [tb_Verbindung_Lehrer_Schulfach] LS
		ON  LS.Mitarbeiter_ID= M.Mitarbeiter_ID LEFT JOIN [tb_Schulfächer] F
		ON F.Schulfach_ID=LS.Schulfach_ID
		--WHERE Statement added, otherwise you see secretary and peops which have to teaching licence
		WHERE M.Schulform_ID IS NOT NULL;
