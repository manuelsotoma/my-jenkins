#!/bin/bash

. install-docker.sh
. install-docker-machine.sh
. install-docker-compose.sh

mkdir /home/persistent
mkdir /home/persistent/jenkins_home
mkdir /home/persistent/docker-engine
mkdir /home/persistent/docker-machine

export MACHINE_STORAGE_PATH="/home/persistent/docker-machine"
echo 'export VARNAME="my value"'>>/etc/environment 

. jenkins-container.sh 
