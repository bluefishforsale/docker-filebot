#!/usr/bin/env bash

SERVICE="filebot"
IMAGE="rednoah/filebot"
VERSION="node"
DATADIR="/data01"

docker stop ${SERVICE}
docker rm ${SERVICE}

sudo docker run -d \
  -p 8906:5452 \
  -e FILEBOT_CMD_UID=1001 -e FILEBOT_CMD_GID=1001 \
  --name=${SERVICE} \
  --hostname=${HOSTNAME} \
  -v ${DATADIR}/services/${SERVICE}:/config \
  -v /M2scratch/:/M2Scratch \
  -v ${DATADIR}/:/volume1/download/ \
  -v ${DATADIR}/complete:/dest \
  ${IMAGE}:${VERSION}

docker logs ${SERVICE}
