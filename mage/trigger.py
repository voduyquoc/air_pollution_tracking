import os
import requests

class MageTrigger:
    OPTIONS = {
      "<pipeline_name>": {
        "trigger_id": 2, 
        "key": "f012ef165deb4ecd9620529b55e05552"
        }
    }

    @staticmethod
    def trigger_pipeline(pipeline_name, variables=None):
        trigger_id = MageTrigger.OPTIONS[pipeline_name]["trigger_id"]
        key = MageTrigger.OPTIONS[pipeline_name]["key"]
        endpoint = f"http://localhost:6789/api/pipeline_schedules/{trigger_id}/pipeline_runs/{key}"
        headers = {'Content-Type': 'application/json'}
        payload = {}

        if variables is not None:
            payload['pipeline_run'] = {'variables': variables}

        response = requests.post(endpoint, headers=headers, json=payload)
        return response

MageTrigger.trigger_pipeline("<pipeline_name>")
