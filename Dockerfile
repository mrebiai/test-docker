ARG BUILDER_IMAGE="test-docker:builder"
FROM --platform=${BUILDPLATFORM} ${BUILDER_IMAGE} AS builder

FROM eclipse-temurin:21.0.6_7-jre AS minimal

COPY --from=builder test-docker*.jar /test-docker.jar

CMD ["java", "-jar", "/test-docker.jar"]