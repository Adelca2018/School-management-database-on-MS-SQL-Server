
-----------------ABFRAGE BESCHREIBUNG-----------------------------
--
-- Diese Abfrage zeigt die Lehrer mit ihrer Qualifikationen und
-- die Schulfächer, die sie beibringen können

------------------------------------------------------------------


USE [Schulnotenverwaltung_Draft]
GO

SELECT M.Mitarbeiter_Vorname, M.Mitarbeiter_Nachname,  Q.Schulform_Bezeichnung as Qualifikation,F.Schulfach_Bezeichnung
FROM [tb_Mitarbeiter] M INNER JOIN [Schulform_Qualifikation] Q 
ON  M.Schulform_ID=Q.Schulform_ID INNER JOIN [tb_Verbindung_Lehrer_Schulfach] LS
ON  LS.Mitarbeiter_ID= M.Mitarbeiter_ID Inner JOIN [tb_Schulfächer] F
ON F.Schulfach_ID=LS.Schulfach_ID;