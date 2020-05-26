CREATE VIEW [dbo].[Übersicht_Notfallkontakte_Schüler] AS
SELECT H.Berechtigten_Name AS 'Notfallkontakt',H.Berechtigten_Telefonnr AS 'Telefon-Nr.', P.Schüler_Vorname, P.Schüler_Name, N.Klassen_Stufe,M.Schulform_Bezeichnung
FROM dbo.tb_Berechtigten H
INNER JOIN dbo.tb_Verbindung_Berechtigten_Schüler Q
ON H.Berechtigten_ID= Q.Berechtigten_ID
INNER JOIN dbo.tb_Schüler P
ON Q.Schüler_ID=P.Schüler_ID
INNER JOIN dbo.tb_Verbindung_Schueler_Klasse L
ON P.Schüler_ID=L.Schüler_ID
INNER JOIN dbo.tb_Klassen N
ON L.Klassen_ID=N.Klassen_ID
INNER JOIN dbo.Schulform_Qualifikation M
ON N.Schulform_ID=M.Schulform_ID
WHERE H.Berechtigten_Notfallkontakt =1
AND L.Schuljahr ='2019-2020';
