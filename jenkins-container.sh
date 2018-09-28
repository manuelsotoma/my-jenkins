#!/bin/bash

docker pull manuelsotoma/my-jenkins

docker run -d \
	-p 8080:8080                                                       \
	-p 50000:50000                                                     \
	\
	-v /var/run/docker.sock:/var/run/docker.sock                       \
	-v /etc/docker:/etc/docker                                         \
	\
	-v /usr/bin/docker:/usr/bin/docker                                 \
	-v /usr/bin/docker-machine:/usr/bin/docker-machine                 \
	-v /usr/bin/docker-compose:/usr/bin/docker-compose                 \
	\
	-v /home/persistent/jenkins-home:/var/jenkins_home                 \
	-v /home/persistent/docker-engine:/home/persistent/docker-engine   \
	-v /home/persistent/docker-machine:/home/persistent/docker-machine \
	\
	--restart yes                                                      \
	--name my-jenkins                                                  \
	manuelsotoma/my-jenkins	
