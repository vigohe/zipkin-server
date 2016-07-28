#!/bin/bash

CONTAINER_IP='http://rancher-metadata/latest/self/container/primary_ip'

STATUS_CODE=$(curl --write-out %{http_code} --silent --output /dev/null ${CONTAINER_IP})

if [ "$STATUS_CODE" -eq "200" ] ; then
    IP_ADDRESS=$(curl http://rancher-metadata/latest/self/container/primary_ip)
    export EUREKA_INSTANCE_HOSTNAME=${IP_ADDRESS}
    export EUREKA_INSTANCE_PREFER-IP-ADDRESS=true
    export EUREKA_INSTANCE_IP-ADDRESS=${IP_ADDRESS}
fi

exec java -jar /entrypoint/app.jar \
    -Djava.security.egd=file:/dev/./urandom