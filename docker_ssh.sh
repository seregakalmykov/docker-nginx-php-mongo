#!/bin/bash
docker ps

echo "Type current container ID to ssh in, followed by [ENTER]":
read CONTAINER_ID

docker exec -i -t $CONTAINER_ID /bin/bash