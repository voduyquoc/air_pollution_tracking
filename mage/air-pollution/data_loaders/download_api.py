import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):
    """
    Template for loading data from API
    """
    url = 'https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=bfdd4fa139528dd83f09a31cebb41760'
    response = requests.get(url)

    #return pd.read_csv(io.StringIO(response.text), sep=',')
    print(response)
    return response


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
