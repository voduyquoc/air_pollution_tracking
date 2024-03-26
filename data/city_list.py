import json
import pandas as pd

with open('city_list_new.json', encoding='utf-8') as f:
    data = json.load(f)

df = pd.json_normalize(data, 
                       meta=['id', 'name', 'state', 'country', ['coord', 'lon'], ['coord', 'lat']])

df = df[df['country'] == 'DE']

df.to_csv('de_new.csv')
