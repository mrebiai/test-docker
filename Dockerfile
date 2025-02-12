FROM eclipse-temurin:21-jre AS base

COPY entrypoint.sh /entrypoint.sh

ARG FOO
ENV FOO=${FOO}

ENTRYPOINT [ "/entrypoint.sh" ]
