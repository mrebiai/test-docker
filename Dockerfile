FROM eclipse-temurin:21-jdk AS builder

COPY lib /lib
COPY *.gradle.kts ./
COPY gradle.properties .
COPY gradlew .
COPY gradle gradle
RUN ./gradlew build

FROM eclipse-temurin:21-jre AS app
COPY --from=builder /lib/build/libs/lib.jar /lib.jar

CMD ["java", "-cp", "/lib.jar", "org.example.LibraryKt"]