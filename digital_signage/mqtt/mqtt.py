import os
from paho.mqtt.client import Client


class MyMQTTClass(Client):

    # def __init__(self):
    #     super(MyMQTTClass, self).__init__()

    def on_connect(self, mqttc, obj, flags, rc):
        print("rc: "+str(rc))

    def on_message(self, mqttc, obj, msg):
        print(msg.topic+" "+str(msg.qos)+" "+str(msg.payload))

    def on_publish(self, mqttc, obj, mid):
        print("mid: "+str(mid))

    def on_subscribe(self, mqttc, obj, mid, granted_qos):
        print("Subscribed: "+str(mid)+" "+str(granted_qos))

    def on_log(self, mqttc, obj, level, string):
        print(string)

    def run(self, topic):
        self.connect(os.environ['MQTT_HOSTNAME'])
        self.subscribe(topic)

        rc = 0
        while rc == 0:
            rc = self.loop()
        return rc


mqtt = MyMQTTClass()