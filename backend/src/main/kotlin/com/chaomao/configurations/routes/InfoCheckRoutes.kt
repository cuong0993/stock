package com.chaomao.configurations.routes

import com.chaomao.configurations.plugins.getKoinInstance
import com.chaomao.modules.infocheck.InfoCheckController
import com.chaomao.modules.infocheck.InfoCheckResponse
import com.papsign.ktor.openapigen.route.info
import com.papsign.ktor.openapigen.route.path.normal.NormalOpenAPIRoute
import com.papsign.ktor.openapigen.route.path.normal.get
import com.papsign.ktor.openapigen.route.response.respond
import com.papsign.ktor.openapigen.route.route

const val INFO_CHECK = "/infocheck"

fun NormalOpenAPIRoute.infoCheck() {
    getInfoCheck()
}

fun NormalOpenAPIRoute.getInfoCheck() {
    route(INFO_CHECK) {
        get<Unit, InfoCheckResponse>(
            info("Info check")
        ) {
            val controller: InfoCheckController = getKoinInstance()
            val result = controller.get()
            respond(result)
        }
    }
}
