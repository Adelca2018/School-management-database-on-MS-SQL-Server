CREATE VIEW [dbo].[�bersicht_Notfallkontakte_Sch�ler] AS
SELECT H.Berechtigten_Name AS 'Notfallkontakt',H.Berechtigten_Telefonnr AS 'Telefon-Nr.', P.Sch�ler_Vorname, P.Sch�ler_Name, N.Klassen_Stufe,M.Schulform_Bezeichnung
FROM dbo.tb_Berechtigten H
INNER JOIN dbo.tb_Verbindung_Berechtigten_Sch�ler Q
ON H.Berechtigten_ID= Q.Berechtigten_ID
INNER JOIN dbo.tb_Sch�ler P
ON Q.Sch�ler_ID=P.Sch�ler_ID
INNER JOIN dbo.tb_Verbindung_Schueler_Klasse L
ON P.Sch�ler_ID=L.Sch�ler_ID
INNER JOIN dbo.tb_Klassen N
ON L.Klassen_ID=N.Klassen_ID
INNER JOIN dbo.Schulform_Qualifikation M
ON N.Schulform_ID=M.Schulform_ID
WHERE H.Berechtigten_Notfallkontakt =1
AND L.Schuljahr ='2019-2020';
