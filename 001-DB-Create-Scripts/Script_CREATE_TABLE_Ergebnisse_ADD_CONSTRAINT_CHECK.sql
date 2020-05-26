USE [Schulnotenverwaltung_Draft]
GO

/****** Object:  Table [dbo].[tb_Ergebnisse]    Script Date: 29/04/2020 14:45:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Ergebnisse](
	[Ergebnis_ID] [nvarchar](50) NOT NULL,
	[Ergebnis_Datum] [date] NOT NULL,
	[Schüler_ID] [nvarchar](50) NOT NULL,
	[Schulfach_ID] [int] NOT NULL,
	[Aufgabenart_ID] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](50) NOT NULL,
	[Klassen_ID] [nvarchar](50) NOT NULL,
	[Raum_ID] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tb_Ergebnisse] ADD  CONSTRAINT [DF_tb_Ergebnisse_Ergebnis_Datum]  DEFAULT (getdate()) FOR [Ergebnis_Datum]
GO

ALTER TABLE [dbo].[tb_Ergebnisse]  WITH CHECK ADD  CONSTRAINT [CK_tb_Ergebnisse_Note] CHECK  (([Note]>(0) AND [Note]<(7)))
GO

ALTER TABLE [dbo].[tb_Ergebnisse] CHECK CONSTRAINT [CK_tb_Ergebnisse_Note]
GO


