FROM arm32v7/ubuntu:16.04

RUN apt-get update && \
    apt-get install software-properties-common -y && \
    apt-add-repository ppa:mosquitto-dev/mosquitto-ppa && \
    apt-get update && \
    apt-get install mosquitto -y && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log

#ARG USER=mosquitto
#ARG GROUP=mosquitto
#ARG USERID=1000
#ARG GROUPID=1000
#RUN cat /etc/passwd && useradd -u ${USERID} -g ${GROUP} -m -s /bin/bash ${USER} && \
#    chown -R ${USERID}:${GROUPID} /mosquitto

#USER $USER

ADD mosquitto.conf /mosquitto/config/mosquitto.conf
RUN chown -R 106:108 /mosquitto
USER mosquitto
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
