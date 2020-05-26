use [Schulnotenverwaltung_Draft]
GO
--Berechtigungen TB-Ergebnisse
GRANT INSERT ON [dbo].[tb_Ergebnisse] TO [Charles_Gaulles_005]
GO
use [Schulnotenverwaltung_Draft]
GO
GRANT SELECT ON [dbo].[tb_Ergebnisse] TO [Charles_Gaulles_005]
GO
use [Schulnotenverwaltung_Draft]
GO
GRANT UPDATE ON [dbo].[tb_Ergebnisse] TO [Charles_Gaulles_005]
GO

use [Schulnotenverwaltung_Draft]
GO
--Berechtigungen TB Schüler
GRANT SELECT ON [dbo].[tb_Schüler] TO [Charles_Gaulles_005]
GO
use [Schulnotenverwaltung_Draft]
GO
--Berechtigungen TB Notfallkontakte
GRANT SELECT ON [dbo].[Übersicht_Notfallkontakte_Schüler] TO [Charles_Gaulles_005]
GO
use [Schulnotenverwaltung_Draft]
GO
GRANT UPDATE ON [dbo].[Übersicht_Notfallkontakte_Schüler] TO [Charles_Gaulles_005]
GO
