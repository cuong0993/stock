val ktor_version: String by project
val kotlin_version: String by project
val logback_version: String by project

plugins {
    application
    kotlin("jvm") version "1.6.21"
    id("com.google.cloud.tools.jib") version "3.2.1"
    id("org.graalvm.buildtools.native") version "0.9.11"
}

group = "com.chaomao"
version = "0.0.1"
application {
    mainClass.set("com.chaomao.ApplicationKt")

    val isDevelopment: Boolean = project.ext.has("development")
    applicationDefaultJvmArgs = listOf("-Dio.ktor.development=$isDevelopment")
}

repositories {
    mavenCentral()
}

tasks {
    val javaVersion = JavaVersion.VERSION_17.toString()

    withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile> {
        sourceCompatibility = javaVersion
        targetCompatibility = javaVersion
        kotlinOptions.jvmTarget = javaVersion
    }

    withType<JavaCompile> {
        sourceCompatibility = javaVersion
        targetCompatibility = javaVersion
    }
}

dependencies {
    implementation("io.ktor:ktor-server-core-jvm:$ktor_version")
    implementation("io.ktor:ktor-server-cio-jvm:$ktor_version")
    implementation("ch.qos.logback:logback-classic:$logback_version")
    testImplementation("io.ktor:ktor-server-tests-jvm:$ktor_version")
    testImplementation("org.jetbrains.kotlin:kotlin-test-junit:$kotlin_version")
    implementation("org.ta4j:ta4j-core:0.14")
    implementation("org.apache.poi:poi-ooxml:5.2.2")
    implementation("com.google.auth:google-auth-library-oauth2-http:1.6.0")
    implementation("com.google.apis:google-api-services-drive:v3-rev20220417-1.32.1")
}

jib {
    from {
        image = "eclipse-temurin:17-jre@sha256:b4d622a58a70eab8b6a7a08a568fc1d5857c3eadd88f8061d5991c8c8837f749"
    }
    container {
        ports = listOf("8080")
        mainClass = mainClass
    }
}

graalvmNative {
    binaries {
        named("main") {
            imageName.set("app")
            mainClass.set(application.mainClass.get())
            verbose.set(true)
            fallback.set(false)
            buildArgs.add("--report-unsupported-elements-at-runtime")
            buildArgs.add("--install-exit-handlers")
            buildArgs.add("--enable-http")
            buildArgs.add("--enable-https")
            buildArgs.add("--initialize-at-build-time=io.ktor,kotlinx,kotlin")
            buildArgs.add("-H:+ReportUnsupportedElementsAtRuntime")
            buildArgs.add("-H:+ReportExceptionStackTraces")
            buildArgs.add("-H:+PrintClassInitialization")
            buildArgs.add("-H:+AddAllCharsets")
            configurationFileDirectories.from(file("META-INF/native-image"))
            useFatJar.set(true)
        }
    }
}

if (project.hasProperty("gcp_project")) {
    val gcp_project: String by project
    jib.to.image = "gcr.io/$gcp_project/app"
}