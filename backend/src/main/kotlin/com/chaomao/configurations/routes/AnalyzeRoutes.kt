package com.chaomao.configurations.routes

import com.chaomao.configurations.plugins.getKoinInstance
import com.chaomao.modules.analyze.AnalyzeController
import com.chaomao.modules.analyze.AnalyzeRequestBody
import com.chaomao.modules.analyze.AnalyzeResponse
import com.chaomao.modules.analyze.post
import com.papsign.ktor.openapigen.route.info
import com.papsign.ktor.openapigen.route.path.normal.NormalOpenAPIRoute
import com.papsign.ktor.openapigen.route.path.normal.post
import com.papsign.ktor.openapigen.route.response.respond
import com.papsign.ktor.openapigen.route.route
import com.papsign.ktor.openapigen.route.throws
import io.konform.validation.Invalid
import io.konform.validation.Validation
import io.ktor.http.HttpStatusCode
import java.time.LocalDate
import java.time.format.DateTimeParseException

const val ANALYZE = "/analyze"

fun NormalOpenAPIRoute.analyze() {
    postAnalyze()
}

fun NormalOpenAPIRoute.postAnalyze() {
    route(ANALYZE) {
        throws(
            HttpStatusCode.InternalServerError,
            "Internal server error",
            { ex: Exception -> "Internal server error: ${ex.message}" }
        ) {
            throws(
                HttpStatusCode.BadRequest,
                "Bad request",
                { ex: DateTimeParseException -> "Invalid date: ${ex.message}" }
            ) {
                post<Any, AnalyzeResponse, AnalyzeRequestBody>(
                    info("Analyze market at a specific date")
                ) { _, req ->

                    val validate = Validation {
                        AnalyzeRequestBody::date {
                            addConstraint("When specifying analyze date, it should not be in the future") {
                                if (it == null) {
                                    true
                                } else {
                                    it <= LocalDate.now()
                                }
                            }
                            addConstraint(
                                "When specifying analyze date," +
                                    "it should not before the first day 2000-07-28"
                            ) {
                                if (it == null) {
                                    true
                                } else {
                                    it >= LocalDate.of(2000, 7, 28)
                                }
                            }
                        }
                    }
                    val validationResult = validate(req)
                    if (validationResult is Invalid) {
                        throw DateTimeParseException(validationResult.errors.first().message, "", 0)
                    }
                    val result = post()
                    val controller: AnalyzeController = getKoinInstance()
                    controller.process(req)
                    // FIXME Tried to process asynchronously but could not because Clourun only active in request context, returning a response will make the instance idle
                    respond(result)
                }
            }
        }
    }
}
