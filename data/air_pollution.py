import json
import requests
import os
import time
import datetime
import requests
import pandas as pd
import pytz
from dotenv import load_dotenv

load_dotenv()
API_KEY = os.getenv("API_KEY")
TIME_T0 = 1606266000

def get_current_time():
    # Get current time
    current_time = datetime.datetime.now()

    # Convert to UTC time zone
    current_time_utc = datetime.datetime.now(pytz.utc)

    # Convert UTC time to Unix time
    unix_time = int(current_time_utc.timestamp())
    print("Current time in local:", current_time.strftime("%Y-%m-%d %H:%M:%S %Z"))
    print("Current time in UTC:", current_time_utc.strftime("%Y-%m-%d %H:%M:%S %Z"))
    print("Unix time:", unix_time)
    return unix_time

def utcunix_to_local(timepoint):
    utc_datetime = datetime.datetime.fromtimestamp(timepoint)
    return utc_datetime

def get_weather(api_key):
    url = f"https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID={api_key}"
    response = requests.get(url).json()
    return response

def get_historical(lat, lon, start, end, api_key):
    url = f"http://api.openweathermap.org/data/2.5/air_pollution/history?lat={lat}&lon={lon}&start={start}&end={end}&appid={api_key}"
    response = requests.get(url).json()
    
    if 'coord' not in response:
        return None
    
    location = response['coord']
    
    if 'list' not in response:
        return None
    
    historical_data = response['list']
    
    data = [format_response(location, historical) for historical in historical_data]
    df = pd.DataFrame(data)
    return df

def format_response(location, historical):
    components = historical['components']
    data = {
        'lon': str(location['lon']),
        'lat': str(location['lat']),
        'aqi': str(historical['main']['aqi']),
        'co': float(components['co']),
        'no': float(components['no']),
        'no2': float(components['no2']),
        'o3': float(components['o3']),
        'so2': float(components['so2']),
        'pm2_5': float(components['pm2_5']),
        'pm10': float(components['pm10']),
        'nh3': float(components['nh3']),
        'time': utcunix_to_local(historical['dt'])
    }
    return data

def process_data(city_list, TIME_T0, CURRENT_TIME, API_KEY):
    columns = ['lon', 'lat', 'aqi', 'co', 'no', 'no2', 'o3', 'so2', 'pm2_5', 'pm10', 'nh3', 'time']
    df = pd.DataFrame(columns=columns)

    for index, row in city_list.iterrows():
        data = get_historical(lat=row['Latitude'], lon=row['Longitude'], start=TIME_T0, end=CURRENT_TIME, api_key=API_KEY)
        if data is not None:
            df = pd.concat([df, data], ignore_index=True)

    return df

if __name__ == '__main__':
    t0 = time.time()
    CURRENT_TIME = get_current_time()
    city_list = pd.read_csv('germany_city.csv')  # Load city list
    df = process_data(city_list, TIME_T0, CURRENT_TIME, API_KEY)
    print(df.info())
    t1 = time.time()
    print(f'took {(t1 - t0):.2f} seconds')
    print(df.head(5))
    