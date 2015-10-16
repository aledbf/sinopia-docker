FROM mhart/alpine-node:3.2.0

MAINTAINER aledbf <aledbf@gmail.com>

COPY build.sh /build.sh

RUN /build.sh

WORKDIR /sinopia

COPY config.yaml /sinopia/config.yaml

USER nodejs

CMD ["/sinopia/bin/sinopia", "--config", "/sinopia/config.yaml"]

EXPOSE 4873

VOLUME /sinopia/storage
