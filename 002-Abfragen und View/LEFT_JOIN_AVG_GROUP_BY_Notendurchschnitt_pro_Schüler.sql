SELECT tb_Sch�ler.Sch�ler_ID, AVG(tb_Ergebnisse.Note)
FROM tb_Ergebnisse
LEFT JOIN tb_Sch�ler ON tb_Sch�ler.Sch�ler_ID = tb_Ergebnisse.Sch�ler_ID
GROUP BY tb_Sch�ler.Sch�ler_ID