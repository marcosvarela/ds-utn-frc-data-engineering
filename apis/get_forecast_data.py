import requests
import csv
import datetime as dt

endpoint = 'https://api.openweathermap.org/data/2.5/onecall'
params = {
    'lat': '-31.40617395950068',
    'lon': '-64.19400268147642',
    'lang': 'es',
    'appid': 'XXXXXX',
    'exclude': 'minutely,daily',
    'units': 'metric',
}

response = requests.get(endpoint, params=params)

file_location = 'pronostico_tiempo.csv'

with open(file_location, 'w') as file_out:
    writer = csv.DictWriter(file_out, lineterminator='\n', fieldnames=['timestamp_local', 'humedad_relativa', 'temperatura'])

    for sample in response.json()['hourly']:
        writer.writerow({
            'timestamp_local': dt.datetime.fromtimestamp(int(sample['dt'])).isoformat(),
            'humedad_relativa': sample['humidity'],
            'temperatura': sample['temp']
        })
