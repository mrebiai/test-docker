FROM eclipse-temurin:21.0.6_7-jdk AS builder

COPY .git .git
COPY src src
COPY *.gradle.kts ./
COPY gradle.properties .
COPY gradlew .
COPY gradle gradle
RUN ./gradlew build

FROM eclipse-temurin:21.0.6_7-jre AS app
ARG BUILD_VERSION="unspecified"
LABEL org.opencontainers.image.description="Karate enriched with extensions to connect to other systems"
LABEL org.opencontainers.image.licenses="Apache-2.0"
LABEL org.opencontainers.image.version="${BUILD_VERSION}"

COPY --from=builder /build/libs/test-docker*.jar /test-docker.jar

CMD ["java", "-jar", "/test-docker.jar"]