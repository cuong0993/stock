val ktorVersion: String by project
val kotlinVersion: String by project
val logbackVersion: String by project

plugins {
    application
    kotlin("jvm") version "1.7.10"
    id("com.google.cloud.tools.jib") version "3.2.1"
    id("org.graalvm.buildtools.native") version "0.9.13"
    id("com.github.ben-manes.versions") version "0.42.0"
}

group = "com.chaomao"
version = "0.0.1"
application {
    mainClass.set("com.chaomao.configurations.ApplicationKt")

    val isDevelopment: Boolean = project.ext.has("development")
    applicationDefaultJvmArgs = listOf("-Dio.ktor.development=$isDevelopment")
}

repositories {
    mavenCentral()
}

tasks {
    val javaVersion = JavaVersion.VERSION_17.toString()

    withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile> {
        kotlinOptions.jvmTarget = javaVersion
    }

    withType<JavaCompile> {
        sourceCompatibility = javaVersion
        targetCompatibility = javaVersion
    }
}

dependencies {
    implementation("io.ktor:ktor-server-core-jvm:$ktorVersion")
    implementation("io.ktor:ktor-server-netty-jvm:$ktorVersion")
    implementation("ch.qos.logback:logback-classic:$logbackVersion")
    testImplementation("io.ktor:ktor-server-tests-jvm:$ktorVersion")
    testImplementation("org.jetbrains.kotlin:kotlin-test-junit:$kotlinVersion")
    implementation("org.ta4j:ta4j-core:0.14")
    implementation("org.apache.poi:poi-ooxml:5.2.2")
    implementation("org.apache.commons:commons-csv:1.9.0")
    implementation("com.google.auth:google-auth-library-oauth2-http:1.8.1")
    implementation("com.google.cloud:google-cloud-firestore:3.3.0")
    implementation("com.google.cloud:google-cloud-storage:2.10.0")
    implementation("io.insert-koin:koin-ktor:3.2.0")
    implementation("dev.forst:ktor-openapi-generator:0.4.4")
    implementation("io.ktor:ktor-server-content-negotiation:$ktorVersion")
    implementation("io.ktor:ktor-serialization-gson:$ktorVersion")
    implementation("io.ktor:ktor-server-call-logging:$ktorVersion")
    implementation("org.apache.logging.log4j:log4j-to-slf4j:2.18.0")
    implementation("com.google.cloud:google-cloud-logging-logback:0.127.0-alpha")
}

jib {
    container {
        ports = listOf("8080")
        mainClass = mainClass
        creationTime = "USE_CURRENT_TIMESTAMP"
    }
    extraDirectories {
        paths {
            path {
                setFrom("config/gcloud")
                into = "/app/resources"
            }
        }
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

if (project.hasProperty("gcpProject")) {
    val gcpProject: String by project
    jib.to.image = "gcr.io/$gcpProject/app"
}
