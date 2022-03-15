package com.chaomao

import com.chaomao.plugins.configureRouting
import io.ktor.server.application.Application

fun main(args: Array<String>): Unit =
    io.ktor.server.netty.EngineMain.main(args)

@Suppress("unused") // application.conf references the main function.
fun Application.module() {
    configureRouting()
}