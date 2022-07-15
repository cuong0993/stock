package com.chaomao.configurations.routes

import com.chaomao.modules.analyze.AnalyzeController
import io.ktor.http.HttpStatusCode
import io.ktor.server.application.call
import io.ktor.server.response.respondText
import io.ktor.server.routing.Route
import io.ktor.server.routing.Routing
import io.ktor.server.routing.get
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import org.koin.ktor.ext.inject
import java.text.SimpleDateFormat
import java.util.*

fun Routing.analyze() {
    getAnalyze()
}

fun Route.getAnalyze() {
    val controller: AnalyzeController by inject()

    get("/analyze") {
        val date = if (call.request.queryParameters["date"] != null) {
            SimpleDateFormat("yyyy-MM-dd").apply { timeZone = TimeZone.getTimeZone("UTC") }
                .parse(call.request.queryParameters["date"])
        } else {
            Date()
        }
        launch (Dispatchers.IO){
            controller.get(date)
        }
        call.respondText("Done", status = HttpStatusCode.OK)

    }
}
