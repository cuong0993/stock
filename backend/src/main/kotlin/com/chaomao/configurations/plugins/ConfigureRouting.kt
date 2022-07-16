package com.chaomao.configurations.plugins

import com.chaomao.configurations.routes.analyze
import com.chaomao.configurations.routes.healthCheck
import com.chaomao.configurations.routes.infoCheck
import com.chaomao.modules.analyze.AnalyzeController
import com.chaomao.modules.analyze.AnalyzeResponse
import com.papsign.ktor.openapigen.openAPIGen
import com.papsign.ktor.openapigen.route.apiRouting
import com.papsign.ktor.openapigen.route.response.respond
import io.ktor.server.application.Application
import io.ktor.server.application.application
import io.ktor.server.application.call
import io.ktor.server.application.log
import io.ktor.server.response.respond
import io.ktor.server.response.respondRedirect
import io.ktor.server.routing.get
import io.ktor.server.routing.post
import io.ktor.server.routing.routing
import kotlinx.coroutines.NonCancellable
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import org.koin.java.KoinJavaComponent
import org.slf4j.LoggerFactory
import java.text.SimpleDateFormat
import java.util.*

fun Application.configureRouting() {
    routing {
        get("/openapi.json") {
            call.respond(application.openAPIGen.api.serialize())
        }
        get("/") {
            call.respondRedirect("/swagger-ui/index.html?url=/openapi.json", true)
        }
        post("/analyze") {
            val controller: AnalyzeController = KoinJavaComponent.getKoin().get()
            call.application.log.debug("analyze request: ${call.request}")




            this.launch {
                call.application.log.debug("analyze request 1: ${call.request}")
                withContext(NonCancellable) {
                    controller.get(Date())
                }

            }
            call.application.log.debug("analyze request 2: ${call.request}")

            call.respond(AnalyzeResponse("","", "", "", ""))

        }
    }
    apiRouting {
        analyze()
        healthCheck()
        infoCheck()
    }
}
