package com.chaomao

import com.chaomao.plugins.configureRouting
import io.ktor.server.cio.CIO
import io.ktor.server.engine.embeddedServer

fun main() {
    embeddedServer(CIO, port = 8080) {
        configureRouting()
    }.start(wait = true)
}