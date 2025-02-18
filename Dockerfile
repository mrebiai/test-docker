FROM eclipse-temurin:21.0.6_7-jdk AS builder

COPY app /app
COPY *.gradle.kts ./
COPY gradle.properties .
COPY gradlew .
COPY gradle gradle
RUN ./gradlew build

FROM eclipse-temurin:21.0.6_7-jre AS app

COPY --from=builder /app/build/libs/app.jar /app.jar

CMD ["java", "-cp", "/app.jar", "org.example.AppKt"]