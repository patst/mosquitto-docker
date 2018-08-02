FROM arm32v7/ubuntu:16.04

RUN apt-get update && \
    apt-get install software-properties-common -y && \
    apt-add-repository ppa:mosquitto-dev/mosquitto-ppa && \
    apt-get update && \
    apt-get install mosquitto -y && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    cp /etc/mosquitto/mosquitto.conf /mosquitto/config && \
    chown -R mosquitto:mosquitto /mosquitto

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
