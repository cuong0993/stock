package com.chaomao.configurations.routes

import com.chaomao.modules.analyze.AnalyzeController
import com.chaomao.modules.analyze.AnalyzeRequestBody
import com.chaomao.modules.analyze.AnalyzeResponse

import com.papsign.ktor.openapigen.route.info
import com.papsign.ktor.openapigen.route.path.normal.NormalOpenAPIRoute
import com.papsign.ktor.openapigen.route.path.normal.post
import com.papsign.ktor.openapigen.route.response.respond
import com.papsign.ktor.openapigen.route.route
import com.papsign.ktor.openapigen.route.throws
import io.ktor.http.HttpStatusCode
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import org.koin.java.KoinJavaComponent
import java.text.ParseException
import java.text.SimpleDateFormat
import java.util.*

const val ANALYZE = "/analyze"

fun NormalOpenAPIRoute.analyze() {
    postAnalyze()
}

fun NormalOpenAPIRoute.postAnalyze() {
    route(ANALYZE) {
        throws(HttpStatusCode.InternalServerError, "Internal server error", { ex: Exception -> ex.toString() }) {
            throws(HttpStatusCode.BadRequest, "Bad request", { ex: ParseException -> ex.message }) {
                post<Any, AnalyzeResponse, AnalyzeRequestBody>(
                    info("Analyze market at a specific date")
                ) { _, param ->
                    val controller: AnalyzeController = KoinJavaComponent.getKoin().get()
                    val date = if (param.date != null) {
                        SimpleDateFormat("yyyy-MM-dd").apply { timeZone = TimeZone.getTimeZone("UTC") }
                            .parse(param.date)
                    } else {
                        Date()
                    }
                    respond(AnalyzeResponse("","", "", "", ""))

                    this.pipeline.launch {
                        withContext(Dispatchers.IO) {
                            val result = controller.get(date)
                        }

                    }
                }
            }
        }
    }
}
