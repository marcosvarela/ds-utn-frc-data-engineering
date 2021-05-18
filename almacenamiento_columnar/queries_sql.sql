SELECT COUNT(*) FROM "ds_frc_utn_2020"."ejemplo_codificacion_json" where estado = 'New York';
SELECT COUNT(*) FROM "ds_frc_utn_2020"."ejemplo_codificacion_parquet" where estado = 'New York';

SELECT SUM(precio_neto) FROM "ds_frc_utn_2020"."ejemplo_codificacion_json" where estado in ('New York', 'Oregon') and cantidad < 3;
SELECT SUM(precio_neto) FROM "ds_frc_utn_2020"."ejemplo_codificacion_parquet" where estado in ('New York', 'Oregon') and cantidad < 3;
