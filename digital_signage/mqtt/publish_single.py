import context  # Ensures paho is in PYTHONPATH
import paho.mqtt.publish as publish


def publish_single(topic, message, hostname="localhost"):
    publish.single(topic, message, hostname=hostname)
    return 
    