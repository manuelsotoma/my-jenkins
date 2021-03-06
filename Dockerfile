FROM jenkins

USER root

RUN apt-get update
RUN apt-get install -y            \
        apt-transport-https       \
        ca-certificates           \
        curl                      \
        gnupg2                    \
        software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable"

RUN apt-get update
RUN apt-get install -y docker-ce

# Install docker-machine
RUN base=https://github.com/docker/machine/releases/download/v0.14.0            && \
    curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine   && \
    install /tmp/docker-machine /usr/local/bin/docker-machine

# Install docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

#RUN     apt-get update                                                                && \
#        apt-get install                                                                  \
#             apt-transport-https                                                         \
#             ca-certificates                                                             \
#             curl                                                                        \
#             gnupg2                                                                      \
#             software-properties-common                                               && \
#        curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -       && \
#        add-apt-repository                                                            && \
#           "deb [arch=amd64] https://download.docker.com/linux/debian                    \
#           $(lsb_release -cs)                                                            \
#           stable"                                                                    && \
#        apt-get update                                                                && \
#        apt-get install docker-ce
#
#RUN     base=https://github.com/docker/machine/releases/download/v0.14.0              && \
#	    curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine     && \
#	    install /tmp/docker-machine /usr/local/bin/docker-machine
#
#RUN     curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
#        chmod +x /usr/local/bin/docker-compose

ENV  MACHINE_STORAGE_PATH /home/persistent/docker-machine


