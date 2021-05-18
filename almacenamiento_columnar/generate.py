from faker import Faker
import pandas as pd

fake = Faker()
Faker.seed(6761)
number_of_rows = range(5000000)

dataframe = pd.DataFrame(
    {
        'nombre_cliente': [fake.name() for _ in number_of_rows],
        'fecha': [str(fake.date_time_this_month()) for _ in number_of_rows],
        'cantidad': [fake.pyint(min_value=1, max_value=10) for _ in number_of_rows],
        'precio_neto': [fake.pyfloat(min_value=25, max_value=1500) for _ in number_of_rows],
        'estado': [fake.state() for _ in number_of_rows]
    }
)

dataframe.to_json('ejemplo_codificacion.json', orient='records', lines=True)
dataframe.to_parquet('ejemplo_codificacion.parquet', engine='pyarrow')
