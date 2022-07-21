package com.chaomao.configurations.routes

import com.chaomao.modules.infocheck.InfoCheckController
import com.chaomao.modules.infocheck.InfoCheckResponse
import com.papsign.ktor.openapigen.route.info
import com.papsign.ktor.openapigen.route.path.normal.NormalOpenAPIRoute
import com.papsign.ktor.openapigen.route.path.normal.get
import com.papsign.ktor.openapigen.route.response.respond
import com.papsign.ktor.openapigen.route.route
import org.koin.java.KoinJavaComponent

const val INFO_CHECK = "/infocheck"

fun NormalOpenAPIRoute.infoCheck() {
    getInfoCheck()
}

fun NormalOpenAPIRoute.getInfoCheck() {
    route(INFO_CHECK) {
        get<Unit, InfoCheckResponse>(
            info("Info check")
        ) {
            val controller: InfoCheckController = KoinJavaComponent.getKoin().get()
            val result = controller.get()
            respond(result)
        }
    }
}
