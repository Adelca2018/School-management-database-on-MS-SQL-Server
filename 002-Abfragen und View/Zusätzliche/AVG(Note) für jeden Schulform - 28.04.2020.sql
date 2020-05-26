SELECT Schulform_Qualifikation.Schulform_Bezeichnung, AVG(tb_Ergebnisse.Note)
FROM tb_Ergebnisse
RIGHT JOIN tb_Klassen ON tb_Ergebnisse.Klassen_ID = tb_Klassen.Klassen_ID
RIGHT JOIN Schulform_Qualifikation ON Schulform_Qualifikation.Schulform_ID = tb_Klassen.Schulform_ID
GROUP BY Schulform_Qualifikation.Schulform_Bezeichnung