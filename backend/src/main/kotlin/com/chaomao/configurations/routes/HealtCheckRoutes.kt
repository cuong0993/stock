package com.chaomao.configurations.routes

import com.chaomao.configurations.plugins.getKoinInstance
import com.chaomao.modules.healthcheck.HealthCheckController
import com.papsign.ktor.openapigen.route.info
import com.papsign.ktor.openapigen.route.path.normal.NormalOpenAPIRoute
import com.papsign.ktor.openapigen.route.path.normal.get
import com.papsign.ktor.openapigen.route.response.respond
import com.papsign.ktor.openapigen.route.route

const val HEALTH_CHECK = "/healthcheck"

fun NormalOpenAPIRoute.healthCheck() {
    getHealthCheck()
}

fun NormalOpenAPIRoute.getHealthCheck() {
    route(HEALTH_CHECK) {
        get<Unit, String>(
            info("Health check")
        ) {
            val controller: HealthCheckController = getKoinInstance()
            val result = controller.get()
            respond(result)
        }
    }
}
