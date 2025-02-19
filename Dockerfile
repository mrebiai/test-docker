FROM eclipse-temurin:21.0.6_7-jdk AS builder

COPY .git .git
COPY src src
COPY *.gradle.kts ./
COPY gradle.properties .
COPY gradlew .
COPY gradle gradle
RUN ./gradlew build

FROM eclipse-temurin:21.0.6_7-jre AS app

COPY --from=builder /build/libs/test-docker*.jar /test-docker.jar

CMD ["java", "-cp", "/test-docker.jar", "org.example.AppKt"]