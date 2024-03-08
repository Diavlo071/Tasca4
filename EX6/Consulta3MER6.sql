use MER6;
/*part 1*/SELECT AVIO.MARCA as "Marca avio", AVIO.MODEL as "Model Avio", AVIO.CAPACITAT as "Capacitat de transport del avio"
/*part 2 SELECT AVIO.MARCA, AVIO.MODEL, AVIO.CAPACITAT,  */
FROM AVIO
WHERE AVIO.MARCA like "Airbus";
/**/