/*
 * This file was generated by the Gradle 'init' task.
 *
 * This generated file contains a sample Kotlin application project to get you started.
 * For more details on building Java & JVM projects, please refer to https://docs.gradle.org/8.11.1/userguide/building_java_projects.html in the Gradle documentation.
 */

group = "io.github.mrebiai"
description = "test-docker"
version = grgitService.service.get().grgit.describe{ tags = true }?.replace("^v".toRegex(), "")?:"0.0.0"

plugins {
    // Apply the org.jetbrains.kotlin.jvm Plugin to add support for Kotlin.
    alias(libs.plugins.kotlin.jvm)
    alias(libs.plugins.grgit.service)


    // Apply the application plugin to add support for building a CLI application in Java.
    application
}

repositories {
    // Use Maven Central for resolving dependencies.
    mavenCentral()
}

dependencies {
    // Use JUnit Jupiter for testing.
    testImplementation(libs.junit.jupiter)

    testRuntimeOnly("org.junit.platform:junit-platform-launcher")

    // This dependency is used by the application.
    implementation(libs.guava)
}

// Apply a specific Java toolchain to ease working on different environments.
java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(21)
    }
}


application {
    // Define the main class for the application.
    mainClass = "org.example.AppKt"
}

tasks.named<Test>("test") {
    // Use JUnit Platform for unit tests.
    useJUnitPlatform()
}

tasks {
    jar {
        manifest {
            attributes(
                mapOf(
                    "Main-Class" to "org.example.AppKt",
                    "Implementation-Title" to "test-docker",
                    "Implementation-Version" to project.version,
                    "Implementation-Vendor" to "Me"
                )
            )
        }
    }
}