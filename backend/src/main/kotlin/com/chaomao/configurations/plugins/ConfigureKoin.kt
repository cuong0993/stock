package com.chaomao.configurations.plugins

import com.chaomao.configurations.container.dependencies
import io.ktor.server.application.Application
import io.ktor.server.application.install
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject
import org.koin.core.module.Module
import org.koin.ktor.plugin.Koin

fun Application.configureKoin(modules: List<Module> = emptyList()) {
    install(Koin) {
        modules(dependencies + modules)
    }
}

inline fun <reified T> getKoinInstance(): T {
    return object : KoinComponent {
        val value: T by inject()
    }.value
}
