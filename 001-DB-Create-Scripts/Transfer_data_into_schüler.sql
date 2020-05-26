INSERT INTO tb_Schüler(
Schüler_ID,
Schüler_Name,
Schüler_Vorname,
Schüler_Geschlecht_ID,
Schüler_Geburtstag,
Schüler_Adresse_Strasse,
Schüler_Adresse_H_Nr,
Schüler_Adresse_PLZ,
Schüler_Adresse_Ort,
Schüler_Schulbeginn,
Schüler_Abschlussjahrgang)
SELECT [student_ID],
		[LastName],
		[FirstName],
		[gender],
		[BirthDate],
		[AddressLine1],
		[Housenr],
		[PostalCode],
		[City],
		[Schüler_Schulbeginn],
      [Abschlussjahrgang]
FROM dbo.Schüler_Daten_upd
