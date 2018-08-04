FROM arm32v7/ubuntu:16.04

RUN apt-get update && \
    apt-get install software-properties-common -y && \
    apt-add-repository ppa:mosquitto-dev/mosquitto-ppa && \
    apt-get update 
RUN apt-get install mosquitto -y
RUN mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    cp /etc/mosquitto/mosquitto.conf /mosquitto/config && \
    usermod -u 1000 mosquitto && \
    groupmod -g 1000 mosquitto && \
    chown -R mosquitto:mosquitto /mosquitto

EXPOSE 1883 9001

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

USER mosquitto

CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
