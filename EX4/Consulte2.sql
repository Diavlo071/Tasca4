use MER4;
SELECT Polissa.NUM_Polissa as "Numero de la Polissa", Tipus_Polissa1 as "Nom pollisa",
Client.DNI, Client.NOM as "Nom client", Client.COGNOM as "Cognom del client"
FROM Client, Polissa, Tipus_Polissa
WHERE Client.DNI = Polissa.Client_DNI and
Tipus_Polissa_ID = Polissa.Tipus_Polissa_ID and
Tipus_Polissa1 = "Viatge"