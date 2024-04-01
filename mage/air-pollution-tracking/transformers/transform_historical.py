if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test
import pandas as pd

@transformer
def transform(data, *args, **kwargs):
    """
    Template code for a transformer block.

    Add more parameters to this function if this block has multiple parent blocks.
    There should be one parameter for each output variable from each parent block.

    Args:
        data: The output from the upstream parent block
        args: The output from any additional upstream blocks (if applicable)

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """
    # Specify your transformation logic here
    new_column_names = {'lon': 'longitude', 
                        'lat': 'latitude',
                        'co': 'Carbon_monoxide_co',
                        'no': 'Nitrogen_monoxide_no',
                        'no2': 'Nitrogen_dioxide_no2',
                        'o3': 'Ozone_o3',
                        'so2': 'Sulphur_dioxide_so2',
                        'pm2_5': 'Fine_particles_matter_pm2_5',
                        'pm10': 'Coarse_particulate_matter_pm10',
                        'nh3': 'Ammonia_nh3',
                        'time': 'recorded_time'}
    data.rename(columns=new_column_names, inplace=True)
    data['recorded_time'] = pd.to_datetime(data['recorded_time'], unit='s')
    print(data.info())
    return data


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
