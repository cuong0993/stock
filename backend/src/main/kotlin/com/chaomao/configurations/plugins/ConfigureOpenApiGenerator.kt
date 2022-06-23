package com.chaomao.configurations.plugins

import com.papsign.ktor.openapigen.OpenAPIGen
import io.ktor.server.application.Application
import io.ktor.server.application.install

fun Application.configureOpenApiGenerator() {
    install(OpenAPIGen) {
        info {
            version = "0.0.1"
            title = "Stock application API"
            description = "Vietnam Stock Exchange API"
        }
    }
}
