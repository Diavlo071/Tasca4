use MER4;
SELECT Client.NOM, Client.COGNOM, Polissa.NUM_Polissa as "Numero de la Polissa"
FROM Client, Polissa	
WHERE Client.DNI = Polissa.Client_DNI and Client.NOM="Joan" and Client.COGNOM="Monjo";
