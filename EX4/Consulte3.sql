use MER4;
SELECT Client.NOM as "Nom Client" , Client.COGNOM as "Cognom Client", Venedor.NOM as "Nom Venedor", Venedor.COGNOM as "Cognom Venedor", Polissa.NUM_Polissa, Tipus_Polissa.NOM as "N Polissa"
FROM Client, Venedor, Polissa, Tipus_Polissa
WHERE Client.DNI = Polissa.Client_DNI and
Venedor.DNI= Polissa.Venedor_DNI and
Tipus_Polissa.ID=Polissa.Tipus_Polissa_ID;
