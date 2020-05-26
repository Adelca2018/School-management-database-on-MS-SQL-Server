SELECT tb_Schulfächer.Schulfach_ID, AVG(tb_Ergebnisse.Note)
FROM tb_Ergebnisse
INNER JOIN tb_Schulfächer ON tb_Ergebnisse.Schulfach_ID = tb_Schulfächer.Schulfach_ID
GROUP BY tb_Schulfächer.Schulfach_ID