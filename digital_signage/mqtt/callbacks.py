import json
import ast

# App imports
from device_management.models import Device


to_update = {
        200: True,
        201: False,
    }


# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
    message = ast.literal_eval(json.dumps(msg.payload.decode('utf-8')))
    message = ast.literal_eval(message)
    Device.objects.filter(uuid__in=message['devices']).update(status=to_update[message['message']])
    