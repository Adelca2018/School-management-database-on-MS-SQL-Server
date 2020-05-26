SELECT tb_Schüler.Schüler_ID, AVG(tb_Ergebnisse.Note)
FROM tb_Ergebnisse
LEFT JOIN tb_Schüler ON tb_Schüler.Schüler_ID = tb_Ergebnisse.Schüler_ID
GROUP BY tb_Schüler.Schüler_ID