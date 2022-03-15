val ktor_version: String by project
val kotlin_version: String by project
val logback_version: String by project

plugins {
    application
    kotlin("jvm") version "1.6.10"
    id("com.google.cloud.tools.jib") version "3.2.0"
}

group = "com.chaomao"
version = "0.0.1"
application {
    mainClass.set("io.ktor.server.netty.EngineMain")

    val isDevelopment: Boolean = project.ext.has("development")
    // applicationDefaultJvmArgs = listOf("-Dio.ktor.development=$isDevelopment")
    applicationDefaultJvmArgs = listOf(
        "-server",
        "-XX:+UseG1GC",
        "-Dfile.encoding=UTF-8",
        "-XX:+UnlockExperimentalVMOptions",
        "-XX:+UseCGroupMemoryLimitForHeap",
        "-XX:+UseContainerSupport",
        "-XX:MaxRAMPercentage=80.0",
        "-XX:InitialRAMPercentage=80.0",
        "-Dio.ktor.development=$isDevelopment"
    )
}

repositories {
    mavenCentral()
    maven { url = uri("https://maven.pkg.jetbrains.space/public/p/ktor/eap") }
}

dependencies {
    implementation("io.ktor:ktor-server-core-jvm:$ktor_version")
    implementation("io.ktor:ktor-server-netty-jvm:$ktor_version")
    implementation("ch.qos.logback:logback-classic:$logback_version")
    testImplementation("io.ktor:ktor-server-tests-jvm:$ktor_version")
    testImplementation("org.jetbrains.kotlin:kotlin-test-junit:$kotlin_version")
    implementation("org.ta4j:ta4j-core:0.14")
    implementation("org.apache.poi:poi-ooxml:5.2.0")
    implementation("com.google.auth:google-auth-library-oauth2-http:1.6.0")
    implementation("com.google.apis:google-api-services-drive:v3-rev20220214-1.32.1")
}

jib {
    to {
        image = "gcr.io/chaomao-stock-dev-0/backend"
    }
//    from {
//        image = "azul/zulu-openjdk-alpine:17"
//    }
    container {
        ports = listOf("8080")
        mainClass = mainClass

        // good defaults intended for Java 8 (>= 8u191) containers
//        jvmFlags = listOf(
//            "-server",
//            "-Djava.awt.headless=true",
//            "-XX:InitialRAMFraction=2",
//            "-XX:MinRAMFraction=2",
//            "-XX:MaxRAMFraction=2",
//            "-XX:+UseG1GC",
//            "-XX:MaxGCPauseMillis=100",
//            "-XX:+UseStringDeduplication"
//        )
    }

    extraDirectories {
        paths {
            path {
                setFrom(project.file("tokens").toPath())
                into = "/"
            }
//            path {
//                setFrom(file("${project(":ear").buildDir}/libs").toPath())
//                into = "/asd" // somewhere as jib will change folder rights to root and jboss cannot handle this
//            }
//            path {
//                setFrom(file("${projectDir}/config/extensions").toPath())
//                into = "/opt/eap/extensions" // somewhere as jib will change folder rights to root and jboss cannot handle this
//            }
//            path {
//                setFrom(file("$buildDir/opentelemetry-javaagent").toPath())
//                into = "/"
//            }
        }
//        permissions = mapOf(
//            "/docker-entrypoint.sh" to "755",
//            "/opt/eap/extensions/postconfigure.sh" to "755",
//            "/opt/eap/extensions/console.sh" to "755",
//        )
    }
}