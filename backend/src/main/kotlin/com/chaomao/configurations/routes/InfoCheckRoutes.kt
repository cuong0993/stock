package com.chaomao.configurations.routes

import com.chaomao.modules.infocheck.InfoCheckController
import com.papsign.ktor.openapigen.route.info
import com.papsign.ktor.openapigen.route.path.normal.NormalOpenAPIRoute
import com.papsign.ktor.openapigen.route.path.normal.get
import com.papsign.ktor.openapigen.route.response.respond
import com.papsign.ktor.openapigen.route.route
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import org.koin.java.KoinJavaComponent

const val INFO_CHECK = "/infocheck"

fun NormalOpenAPIRoute.infoCheck() {
    getInfoCheck()
}

fun NormalOpenAPIRoute.getInfoCheck() {
    route(INFO_CHECK) {
        get<Unit, String>(
            info("Info check")
        ) {

            this.pipeline.launch {
                repeat(10000) {
                    println("Executing background task $it.")
                    delay(1000)
                }
            }
            val controller: InfoCheckController = KoinJavaComponent.getKoin().get()
            val result = controller.get()
            respond(result)
        }
    }
}
