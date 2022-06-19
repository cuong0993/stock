package com.chaomao.configurations.routes

import com.chaomao.modules.healthcheck.HealthCheckController
import io.ktor.http.HttpStatusCode
import io.ktor.server.application.call
import io.ktor.server.response.respondText
import io.ktor.server.routing.Route
import io.ktor.server.routing.Routing
import io.ktor.server.routing.get
import org.koin.ktor.ext.inject

fun Routing.healthCheck() {
    getHealthCheck()
}

fun Route.getHealthCheck() {
    val controller: HealthCheckController by inject()

    get("/healthcheck") {
        val result = controller.get()
        val responseCode = if (result.isSuccess) HttpStatusCode.OK else HttpStatusCode.BadRequest
        call.respondText(status = responseCode, text = result.getOrNull() ?: "Service not found")
    }
}
