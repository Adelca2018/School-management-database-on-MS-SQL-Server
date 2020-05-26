-- Der Direktor max Mustermann darf nur die Liste mit den Notfallkontakten der Schüler sehen, 
-- um im Bedarfsfall Erziehungsberechtigte telefonisch zu informieren

USE [Schulnotenverwaltung_Draft]
GO
CREATE USER [Max_Mustermann_007] FOR LOGIN [Direktor]
GO
use [Schulnotenverwaltung_Draft]
GO
GRANT SELECT ON [dbo].[Übersicht_Notfallkontakte_Schüler] TO [Max_Mustermann_007]
GO
