# yocto_docker_builder
Docker container for building yocto projects

For building docker image: ./docker-build.sh [Dockerfile]

For running docker image on interactive consonle: ./docker-run.sh

Running docker image with configured build script: ./docker-run.sh /home/share/yocto-build.sh 

/home/share directory mounted by the docker-run script. Directory represents the user current directory [PWD].

With using linux a folder created for build directory and mounted by the docker-run script. Build directory on host created under /home/{USER}/opt/yocto
