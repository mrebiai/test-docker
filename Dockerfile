FROM eclipse-temurin:21-jre AS base

ARG foo
ENV foo=${foo}

CMD [ "echo", "${foo}" ]
