# Ingeniería para ciencia de datos
Este repositorio contiene los ejemplos que se muestran en la clase sobre
conceptos de ingeniería de datos en la **Diplomatura Superior en Data 
Science Aplicada** de la UTN FRC.

El objetivo es ayudar al estudio de los conceptos centrales revisados en
clase, el contenido aquí **no debe usarse en ambientes de producción sin
modificaciones**.

## Requisitos
Los ejemplos fueron desarrollados con Python 3.7.0, aunque podés probar 
con otras versiones también porque no hay features muy específicas de versiones 
nuevas que se hayan usado.

En cuanto a los paquetes necesarios, las dependencias están en el archivo 
`requirements.txt`. Para instalarlas se recomienda primero [crear un
virtual 
environment](https://realpython.com/python-virtual-environments-a-primer/) y 
luego ejecutar

```bash
$ pip install -r requirements.txt
```

También se requiere una cuenta en AWS para poder probar cómo funciona el
data lake. Tené en cuenta de que las tareas que lleves a cabo tienen un
costo (bajo, pero costo al fin): desde almacenar objetos en S3 (el 
primer año, sin embargo, 
[es gratis](https://aws.amazon.com/s3/pricing/?nc=sn&loc=4)), hasta
correr queries de Athena y correr una base de datos Aurora. No se 
incluyen las instrucciones de configuración de los servicios.

## Contenido del repositorio
En este repositorio hay 3 ejemplos que se presentan en clase.

### `almacenamiento_columnar/` 
Aquí está el código Python para generar 5 millones de 
registros y guardarlos en formato JSON (orientado a registros) y Parquet 
(orientado a columnas). Puede que quieras cambiar la cantidad de registros a 
generar a algo como 1 millón, para que el proceso no se demore demasiado. Apenas
generados los archivos, vas a poder ver la gran diferencia de tamaños entre 
ellos.

Si además querés probar cuánto tiempo demora una búsqueda en estos archivos
usando AWS Athena (tal como hicimos en la clase), podés crear un bucket en S3 y 
luego subir ambos archivos en alguna ubicación del mismo. Se incluye un archivo
`almacenamiento_columnar/queries_ddl.sql` con las sentencias SQL para generar
el catálogo de datos y así indicarle a Athena cómo interpretar los archivos.
Deberías ajustar las ubicaciones de búsqueda de los archivos para que coincidan
con tu bucket (`ds-utn-frc-2020` en mi caso) y prefijo de claves en S3 (`json/`
y `parquet/` en mi caso; serían las "carpetas" en las que guardé los archivos,
en la primera solo el archivo .json y en la segunda solo el archivo .parquet).

El archivo `almacenamiento_columnar/queries_sql.sql` incluye algunos ejemplos
de cómo se puede consultar ambos archivos usando el esquema previamente creado.
**Notar las diferencias en los tiempos de ejecución.**

Ambos archivos SQL deben ejecutarse usando Athena.

### `apis/`
Script en Python para obtener los datos del tiempo usando la API de OpenWeather
y guardar los resultados en un archivo CSV. 

Si querés probar consultar los datos en AWS Athena, podés subir el archivo CSV
resultante en S3 primero y luego correr la consulta en `apis/queries_ddl.sql`
para así generar el catálogo de datos sobre este archivo y poder consultarlo
usando SQL. Deberías ajustar la ubicación del archivo CSV que acabás de subir
antes de correr esta sentencia SQL.

### `dump_base_de_datos/`
Contiene, en `dump_base_de_datos/select_into.sql`, un ejemplo de cómo podría 
descargarse la información desde una tabla en una base de datos AWS Aurora y 
almacenarse en S3, con el propósito de incluirla así en un data lake.

Si bien este ejemplo requiere que antes hayas provisionado una base de datos
Aurora sobre AWS, puede observarse allí que una de las formas de extraer 
información de una tabla para incluirla en un data lake puede implicar 
seleccionar todos los elementos en ella y convertirla en un formato diferente
(CSV en nuestro caso).
