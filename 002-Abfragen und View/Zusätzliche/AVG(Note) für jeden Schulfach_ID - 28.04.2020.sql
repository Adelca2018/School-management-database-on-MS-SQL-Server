SELECT tb_Schulf�cher.Schulfach_ID, AVG(tb_Ergebnisse.Note)
FROM tb_Ergebnisse
INNER JOIN tb_Schulf�cher ON tb_Ergebnisse.Schulfach_ID = tb_Schulf�cher.Schulfach_ID
GROUP BY tb_Schulf�cher.Schulfach_ID