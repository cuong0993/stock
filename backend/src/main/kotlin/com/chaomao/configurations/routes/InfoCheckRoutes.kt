package com.chaomao.configurations.routes

import com.chaomao.modules.infocheck.InfoCheckController
import io.ktor.http.HttpStatusCode
import io.ktor.server.application.call
import io.ktor.server.response.respondText
import io.ktor.server.routing.Route
import io.ktor.server.routing.Routing
import io.ktor.server.routing.get
import org.koin.ktor.ext.inject

fun Routing.infoCheck() {
    getInfoCheck()
}

fun Route.getInfoCheck() {
    val controller: InfoCheckController by inject()

    get("/infocheck") {
        val result = controller.get()
        val responseCode = if (result.isSuccess) HttpStatusCode.OK else HttpStatusCode.BadRequest
        call.respondText(status = responseCode, text = result.getOrNull() ?: "Service not found")
    }
}
