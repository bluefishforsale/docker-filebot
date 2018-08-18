#!/usr/bin/env bash

SERVICE="filebot"
IMAGE="rednoah/filebot"
VERSION="node"
LOCALDIR="/data01"

docker stop ${SERVICE}
docker rm ${SERVICE}

sudo docker run -d \
  -p 5452:5452 \
  --restart=always \
  --name=${SERVICE} \
  --hostname=${HOSTNAME} \
  -v /data01/services/${SERVICE}:/config \
  -v /M2scratch/autorippr/:/input01 \
  -v /data01:/input02 \
  -v /data01/complete/:/dest \
  ${IMAGE}:${VERSION}

docker logs ${SERVICE}
