FROM eclipse-temurin:21-jre AS base

COPY entrypoint.sh /entrypoint.sh

ARG FOO
RUN echo "${FOO}" | base64 -d > /foo.txt

ENTRYPOINT [ "/entrypoint.sh" ]
