package com.chaomao.configurations.plugins

import com.chaomao.configurations.routes.analyze
import com.chaomao.configurations.routes.healthCheck
import com.chaomao.configurations.routes.infoCheck
import com.papsign.ktor.openapigen.openAPIGen
import com.papsign.ktor.openapigen.route.apiRouting
import io.ktor.server.application.Application
import io.ktor.server.application.application
import io.ktor.server.application.call
import io.ktor.server.response.respond
import io.ktor.server.response.respondRedirect
import io.ktor.server.routing.get
import io.ktor.server.routing.routing

fun Application.configureRouting() {
    routing {
        analyze()
        //healthCheck()
       // infoCheck()
    }
}
