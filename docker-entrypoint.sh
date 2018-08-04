#!/bin/bash

set -e
id
echo "chown /mosquitto folder"
chown -R mosquitto:mosquitto /mosquitto
exec "$@"
