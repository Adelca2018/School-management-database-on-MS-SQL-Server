USE [Schulnotenverwaltung_Draft]
GO


SELECT * 
FROM [dbo].[tf_Geschlechterverteilung_Schulfach_Schulform]('biologie')

/*
Lösung: 
Biologie | Grundschule |divers| 2
Biologie | Grundschule |männlich| 1
Biologie | Grundschule |NULL| 3
Biologie | NULL |NULL| 3*/