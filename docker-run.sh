#!/bin/bash
source env.sh

# build with yocto-build.sh use command below
# ./docker-run.sh /home/share/yocto-build.sh

WORKING_DIR="/home/tevfik/opt/yocto"
USER=$(whoami)

sudo install -o $(id -u) -g $(id -g) -d $WORKING_DIR
#cd $WORKING_DIR
#pwd

docker run -it --rm \
    -v $(pwd):/home/share \
    -v $WORKING_DIR:/home/build \
    "${DOCKER_IMAGE_TAG}" \
    $1
