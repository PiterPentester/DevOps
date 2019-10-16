### MySQL3 Dockerfile ### By Pakhomov B.V.

FROM mysql

MAINTAINER Pakhomov B.V. <shtormless@gmail.com>

ENV MYSQL_DATABASE gogs

COPY ./mysql.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
