package com.chaomao.configurations.routes

import com.chaomao.modules.analyze.AnalyzeController
import com.papsign.ktor.openapigen.annotations.parameters.QueryParam
import com.papsign.ktor.openapigen.route.info
import com.papsign.ktor.openapigen.route.path.normal.NormalOpenAPIRoute
import com.papsign.ktor.openapigen.route.path.normal.get
import com.papsign.ktor.openapigen.route.response.respond
import com.papsign.ktor.openapigen.route.route
import com.papsign.ktor.openapigen.route.throws
import io.ktor.http.HttpStatusCode
import org.koin.java.KoinJavaComponent
import java.text.ParseException
import java.text.SimpleDateFormat
import java.util.*

const val ANALYZE = "/analyze"

fun NormalOpenAPIRoute.analyze() {
    getAnalyze()
}

data class AnalyzeParam(
    @QueryParam("Date") val date: String?
)

fun NormalOpenAPIRoute.getAnalyze() {
    route(ANALYZE) {
        throws(HttpStatusCode.InternalServerError, "Internal server error", { ex: Exception -> ex.toString() }) {
            throws(HttpStatusCode.BadRequest, "Bad request", { ex: ParseException -> ex.message }) {
                get<AnalyzeParam, String>(
                    info("Analyze market at a specific date")
                ) { param ->
                    val controller: AnalyzeController = KoinJavaComponent.getKoin().get()
                    val date = if (param.date != null) {
                        SimpleDateFormat("yyyy-MM-dd").apply { timeZone = TimeZone.getTimeZone("UTC") }
                            .parse(param.date)
                    } else {
                        Date()
                    }
                    val result = controller.get(date)
                    respond(result)
                }
            }
        }
    }
}
