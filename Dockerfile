FROM arm32v7/ubuntu:16.04

RUN apt-get update && \
    apt-get install software-properties-common -y && \
    apt-add-repository ppa:mosquitto-dev/mosquitto-ppa && \
    apt-get update && \
    apt-get install mosquitto -y && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log


CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
