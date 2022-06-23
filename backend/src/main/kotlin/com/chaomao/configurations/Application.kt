package com.chaomao.configurations

import com.chaomao.configurations.plugins.configureCallLogging
import com.chaomao.configurations.plugins.configureContentNegotiation
import com.chaomao.configurations.plugins.configureKoin
import com.chaomao.configurations.plugins.configureOpenApiGenerator
import com.chaomao.configurations.plugins.configureRouting
import io.ktor.server.application.Application
import io.ktor.server.cio.CIO
import io.ktor.server.engine.embeddedServer

fun main() {
    embeddedServer(CIO, port = 8080) {
        module()
    }.start(wait = true)
}

fun Application.module() {
    configureCallLogging()
    configureKoin()
    configureContentNegotiation()
    configureOpenApiGenerator()
    configureRouting()
}
