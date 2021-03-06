USE [Schulnotenverwaltung_Draft]
GO
/****** Object:  UserDefinedFunction [dbo].[tf_Geschlechterverteilung_Schulfach_Schulform]    Script Date: 28/04/2020 21:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Diese Funktion gibt eine Übersicht über die Geschlechterverteilung pro Schulform in dem jeweiligen Fach
*/
ALTER FUNCTION [dbo].[tf_Geschlechterverteilung_Schulfach_Schulform] 
(	

	@Schulfach_Bezeichnung nvarchar(30)

)
RETURNS TABLE 
AS
RETURN 
(
		SELECT  x.Schulfach_Bezeichnung,
	c.Schulform_Bezeichnung,
	u.Geschlecht_Bezeichnung,
	COUNT(DISTINCT h.Mitarbeiter_ID) AS Lehreranzahl_gesamt
	FROM tb_Mitarbeiter h 
	INNER JOIN tb_Verbindung_Lehrer_Schulfach p
		ON h.Mitarbeiter_ID=p.Mitarbeiter_ID
	INNER JOIN tb_Schulfächer x
		ON x.Schulfach_ID=p.Schulfach_ID
	INNER JOIN dbo.Schulform_Qualifikation c
		ON c.Schulform_ID=h.Schulform_ID
	INNER JOIN dbo.Geschlecht u
		ON h.Mitarbeiter_Geschlecht_ID=u.Geschlecht_ID
	WHERE x.Schulfach_Bezeichnung = @Schulfach_Bezeichnung
	GROUP BY ROLLUP(x.Schulfach_Bezeichnung,
	c.Schulform_Bezeichnung,
	u.Geschlecht_Bezeichnung)
)
