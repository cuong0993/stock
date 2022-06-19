package com.chaomao.configurations.container

import com.chaomao.modules.analyze.AnalyzeController
import com.chaomao.modules.healthcheck.HealthCheckController
import com.chaomao.modules.infocheck.InfoCheckController
import org.koin.dsl.module

private val application = module {
}

private val domain = module {
}

private val infrastructure = module {
    factory { HealthCheckController() }
    factory { InfoCheckController() }
    factory { AnalyzeController() }
}

val dependencies = listOf(application, domain, infrastructure)
