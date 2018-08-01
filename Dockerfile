FROM arm32v7/ubuntu:16:04

RUN apt-get update && \
    install -y python-software-properties && \
    apt-add-repository ppa:mosquitto-dev/mosquitto-ppa && \
    apt-get update && \
    apt-get install mosquitto