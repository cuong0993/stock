package com.chaomao.modules.healthcheck

class HealthCheckController {

    fun get(): Result<String> {
        return Result.success("Services running!")
    }
}
