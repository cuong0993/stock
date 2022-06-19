package com.chaomao.configurations.plugins

import com.chaomao.configurations.routes.analyze
import com.chaomao.configurations.routes.healthCheck
import com.chaomao.configurations.routes.infoCheck
import io.ktor.server.application.Application
import io.ktor.server.routing.routing

fun Application.configureRouting() {
    routing {
        analyze()
        healthCheck()
        infoCheck()
    }
}
