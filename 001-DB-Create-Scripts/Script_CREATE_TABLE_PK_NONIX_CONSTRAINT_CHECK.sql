-- =========================================
-- Create table template
-- =========================================
USE Schulnotenverwaltung_Draft 
GO

--------------------------------CREATE TABLE-----------------------------------------------------
/*CREATE TABLE [tb_new_table_Schulverwaltung]
(
	[Column C1] [int]  NOT NULL,
	[Column C2] [nchar](20) NOT NULL,
	[Column C3] [nchar](20) NULL,
)
GO
*/

--------------------------------CREATE PRIMARY KEY-----------------------------------------------------
/*
CREATE CONSTRAINT PK_new_table_Schulverwaltung PRIMARY KEY CLUSTERED (C1)

*/
--------------------------------CREATE NONCLUSTERED INDEX------------------------------------------------
/*
CREATE NONCLUSTERED INDEX IX_new_table_Schulverwaltung
ON new_table_Schulverwaltung.ColumnC2 (C2)  
GO 
*/
--------------------------------------CONSTRAINT CHECK-----------------------------------------------------
/*
ALTER TABLE dbo.tb_new_table_Schulverwaltung   
   ADD ColumnD int NULL   
   CONSTRAINT CHK_ColumnD_DocExc   
   CHECK (ColumnD > 10 AND ColumnD < 50);  
GO  
-- Adding values that will pass the check constraint  
INSERT INTO dbo.DocExc (ColumnD) VALUES (49);  
GO  
-- Adding values that will fail the check constraint  
INSERT INTO dbo.DocExc (ColumnD) VALUES (55);  
GO  
*/
