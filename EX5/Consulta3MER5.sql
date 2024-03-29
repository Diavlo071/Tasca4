use MER5;
SELECT CLIENT.NOM as "Client NOM", VEHICLE.MARCA as "Marca Vehicle" , TIPUS_VEHICLE.NOM as "Vehicle Nom", CITA.DATA_CITA as "cita data", CITA.LLOC as "Lloc de la cita", CLIENT_VEHICLE.DATA_DERRERA_REVISIO as "Darrera revisio del vehicle"
FROM CLIENT, VEHICLE, TIPUS_VEHICLE, CITA, CLIENT_VEHICLE
WHERE CLIENT.DNI=CLIENT_VEHICLE.CLIENT_DNI and
VEHICLE.NUM_BASTIDOR=CLIENT_VEHICLE.VEHICLE_NUM_BASTIDOR AND
TIPUS_VEHICLE.ID=VEHICLE.TIPUS_VEHICLE_ID AND
CLIENT_VEHICLE.ID=CITA.CLIENT_VEHICLE_ID
