### Nexus3 Repo Dockerfile ### By Pakhomov B.V.

FROM centos:centos7

MAINTAINER Pakhomov B.V. <shtormless@gmail.com>

ARG NEXUS_VERSION=3.19.0-01
ARG NEXUS_DOWNLOAD_URL=https://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz
ARG NEXUS_DOWNLOAD_SHA256_HASH=fe041d74b5abc3a3536e8ae200029575b0a955e57493bf23f7c59deb8adb8a25

RUN yum install -y wget java-1.8.0-openjdk \
    && wget ${NEXUS_DOWNLOAD_URL} \
    && tar -xvf nexus-${NEXUS_VERSION}-unix.tar.gz \
    && rm nexus-${NEXUS_VERSION}-unix.tar.gz \
    && mkdir nexus-data

WORKDIR /nexus-${NEXUS_VERSION}/bin

VOLUME sonatype-work

EXPOSE 8081

CMD ./nexus run
