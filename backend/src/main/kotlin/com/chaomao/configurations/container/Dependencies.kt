package com.chaomao.configurations.container

import com.chaomao.configurations.provider.GoogleCloudBlobProvider
import com.chaomao.configurations.provider.LocalBlobProvider
import com.chaomao.modules.analyze.AnalyzeController
import com.chaomao.modules.healthcheck.HealthCheckController
import com.chaomao.modules.infocheck.InfoCheckController
import org.koin.dsl.module

private val application = module {
    val isDevelopment = System.getProperty("io.ktor.development").toBoolean()
    single { if (isDevelopment) LocalBlobProvider() else GoogleCloudBlobProvider() }
}

private val domain = module {
}

private val infrastructure = module {
    factory { HealthCheckController() }
    factory { InfoCheckController() }
    factory { AnalyzeController() }
}

val dependencies = listOf(application, domain, infrastructure)
