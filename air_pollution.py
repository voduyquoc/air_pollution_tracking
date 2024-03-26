import json
import requests


def get_data():
    url = 'https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=bfdd4fa139528dd83f09a31cebb41760'
    response = requests.get(url).json()
    print(json.dumps(response, indent=3))

if __name__ == '__main__':
    get_data()