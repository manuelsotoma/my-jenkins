FROM jenkins

RUN     sudo apt-get update                                                           \
        &&                                                                            \
        sudo apt-get install                                                          \
             apt-transport-https                                                      \
             ca-certificates                                                          \
             curl                                                                     \
             gnupg2                                                                   \
             software-properties-common                                               \
        &&                                                                            \
        curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -  \
        &&                                                                            \
        sudo add-apt-repository                                                       \
           "deb [arch=amd64] https://download.docker.com/linux/debian                 \
           $(lsb_release -cs)                                                         \
           stable"                                                                    \
        &&                                                                            \
        sudo apt-get update &&                                                        \
        &&                                                                            \
        sudo apt-get install docker-ce

RUN     base=https://github.com/docker/machine/releases/download/v0.14.0           && \
	    curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine  && \
	    sudo install /tmp/docker-machine /usr/local/bin/docker-machine

RUN sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    sudo chmod +x /usr/local/bin/docker-compose

ENV  MACHINE_STORAGE_PATH /home/persistent/docker-machine
USER root

