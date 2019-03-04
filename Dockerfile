FROM dpage/pgadmin4:4.2
MAINTAINER Chris Garrett (https://github.com/chris-garrett/docker-pgadmin)
LABEL description="Pgadmin 4.2 on Alpine"

ENV DOCKERIZE_VERSION=v0.6.0

COPY ./scripts/entrypoint.sh /entrypoint.sh

RUN set -ex \
  && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz
