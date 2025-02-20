FROM eclipse-temurin:21.0.6_7-jdk AS builder

COPY .git .git
COPY src src
COPY *.gradle.kts ./
COPY gradle.properties .
COPY gradlew .
COPY gradle gradle
RUN ./gradlew build

FROM eclipse-temurin:21.0.6_7-jre AS minimal
COPY --from=builder /build/libs/test-docker*.jar /test-docker.jar

CMD ["java", "-jar", "/test-docker.jar"]