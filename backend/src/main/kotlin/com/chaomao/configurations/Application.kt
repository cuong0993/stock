package com.chaomao.configurations

import com.chaomao.configurations.plugins.configureCallLogging
import com.chaomao.configurations.plugins.configureContentNegotiation
import com.chaomao.configurations.plugins.configureKoin
import com.chaomao.configurations.plugins.configureOpenApiGenerator
import com.chaomao.configurations.plugins.configureRouting
import io.ktor.server.application.Application
import io.ktor.server.application.log
import io.ktor.server.engine.addShutdownHook
import io.ktor.server.engine.embeddedServer
import io.ktor.server.netty.Netty
import org.slf4j.Logger
import org.slf4j.LoggerFactory

fun main() {
    embeddedServer(Netty, port = 8080) {
        module()
    }.apply {
        addShutdownHook {
            this.application.log.debug("Server shutting down")
        }
    }.start(wait = true)
}

fun Application.module() {
    configureCallLogging()
    configureKoin()
    configureContentNegotiation()
    configureOpenApiGenerator()
    configureRouting()
}

inline fun <reified T> T.getLogger(): Logger {
    return LoggerFactory.getLogger(T::class.java)
}
