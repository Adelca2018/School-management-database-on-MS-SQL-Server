INSERT INTO tb_Sch�ler(
Sch�ler_ID,
Sch�ler_Name,
Sch�ler_Vorname,
Sch�ler_Geschlecht_ID,
Sch�ler_Geburtstag,
Sch�ler_Adresse_Strasse,
Sch�ler_Adresse_H_Nr,
Sch�ler_Adresse_PLZ,
Sch�ler_Adresse_Ort,
Sch�ler_Schulbeginn,
Sch�ler_Abschlussjahrgang)
SELECT [student_ID],
		[LastName],
		[FirstName],
		[gender],
		[BirthDate],
		[AddressLine1],
		[Housenr],
		[PostalCode],
		[City],
		[Sch�ler_Schulbeginn],
      [Abschlussjahrgang]
FROM dbo.Sch�ler_Daten_upd
