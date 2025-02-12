FROM eclipse-temurin:21-jre AS base

ARG FOO
ENV FOO=${FOO}

CMD [ "echo", "${FOO}" ]
