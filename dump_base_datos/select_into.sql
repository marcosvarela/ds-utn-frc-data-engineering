SELECT * FROM sesiones
INTO OUTFILE S3 's3://ds-utn-frc-2020/sql/sesiones'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n'
    OVERWRITE ON;
