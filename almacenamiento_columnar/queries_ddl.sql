-- modificar el nombre del bucket de S3
CREATE EXTERNAL TABLE ejemplo_codificacion_json (
    nombre_cliente string,
    fecha timestamp,
    cantidad int,
    precio_neto double,
    estado string
)
ROW FORMAT serde 'org.apache.hive.hcatalog.data.JsonSerDe'
LOCATION 's3://ds-utn-frc-2020/json/';

-- modificar el nombre del bucket de S3
CREATE EXTERNAL TABLE ejemplo_codificacion_parquet (
    nombre_cliente string,
    fecha string,
    cantidad int,
    precio_neto double,
    estado string
)
STORED AS PARQUET
LOCATION 's3://ds-utn-frc-2020/parquet/'
tblproperties ("parquet.compression"="SNAPPY");
