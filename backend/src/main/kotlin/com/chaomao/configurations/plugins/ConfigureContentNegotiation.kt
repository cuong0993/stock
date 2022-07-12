package com.chaomao.configurations.plugins

import io.ktor.serialization.gson.gson
import io.ktor.server.application.Application
import io.ktor.server.application.install
import io.ktor.server.plugins.contentnegotiation.ContentNegotiation

fun Application.configureContentNegotiation() {
    install(ContentNegotiation) {
        gson()
    }
}
