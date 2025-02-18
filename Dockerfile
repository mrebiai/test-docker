FROM eclipse-temurin:21-jdk AS builder

COPY lib /lib
COPY *.gradle.kts ./
COPY gradle.properties .
COPY gradlew .
COPY gradle gradle
RUN ./gradlew build

FROM eclipse-temurin:21-jre AS app
LABEL org.opencontainers.image.source=https://github.com/mrebiai/test-docker
LABEL org.opencontainers.image.description="test-docker"
LABEL org.opencontainers.image.licenses=Apache-2.0

COPY --from=builder /lib/build/libs/lib.jar /lib.jar

CMD ["java", "-cp", "/lib.jar", "org.example.LibraryKt"]