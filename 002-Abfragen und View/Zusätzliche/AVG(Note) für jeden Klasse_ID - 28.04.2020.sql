SELECT tb_Klassen.Klassen_ID, AVG(tb_Ergebnisse.Note)
FROM tb_Ergebnisse
LEFT JOIN tb_Klassen ON tb_Ergebnisse.Klassen_ID = tb_Klassen.Klassen_ID
GROUP BY tb_Klassen.Klassen_ID