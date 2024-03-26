import json
import requests
import os
import time 
import requests
import pandas as pd
from dotenv import load_dotenv

load_dotenv()
API_KEY = os.getenv("API_KEY")

def get_data(api_key):
    url = f"https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID={api_key}"
    response = requests.get(url).json()
    print(json.dumps(response, indent=3))

if __name__ == '__main__':
    get_data(API_KEY)