#!/bin/bash

# build with yocto-build.sh use command below
# ./docker-run.sh /home/share/yocto-build.sh
DOCKER_IMAGE_TAG="invsombsp-yocto"
USER=$(whoami)
WORKING_DIR="/home/"$USER"/opt/yocto"

sudo install -o $(id -u) -g $(id -g) -d $WORKING_DIR

docker run -it --rm \
    -v $(pwd):/home/share \
    -v $WORKING_DIR:/home/build \
    "${DOCKER_IMAGE_TAG}" \
    $1
