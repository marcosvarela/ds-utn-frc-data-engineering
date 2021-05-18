CREATE EXTERNAL TABLE pronostico_tiempo (
    timestamp_local string,
    humedad_relativa int,
    temperatura float
)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n'
LOCATION 's3://ds-utn-frc-2020/tiempo/';
