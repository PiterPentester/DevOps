### Gogs (Stage) Dockerfile ### By Pakhomov B.V.

FROM centos:centos7


ARG GO_VERSION=1.13.1
ARG GO_DOWNLOAD_URL=https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz
ARG GOGS_BUILD=build56

COPY ${GOGS_BUILD}.tar.gz ${GOGS_BUILD}.tar.gz

RUN yum install -y wget git \
    && useradd -ms /bin/bash git \
    && usermod -aG wheel git \
    && wget ${GO_DOWNLOAD_URL} \
    && tar -C /usr/local -xzvf go${GO_VERSION}.linux-amd64.tar.gz \
    && rm go${GO_VERSION}.linux-amd64.tar.gz \
    && export PATH=$PATH:/usr/local/go/bin \
    && source ~/.bash_profile \
    && tar -xvf ${GOGS_BUILD}.tar.gz \
    && rm ${GOGS_BUILD}.tar.gz \
    && chown -R git ${GOGS_BUILD} \
    && mkdir -p /gogs-repositories \
    && chmod 775 /gogs-repositories \
    && chown -R git /gogs-repositories

EXPOSE 3000

WORKDIR ${GOGS_BUILD}

USER git
CMD ./gogs web

