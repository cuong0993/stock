package com.chaomao.modules.infocheck

class InfoCheckController {

    fun get(): InfoCheckResponse {
        val runtime = Runtime.getRuntime()
        return InfoCheckResponse(
            System.getProperty("java.vm.vendor"),
            System.getProperty("java.vm.version"),
            System.getProperty("os.name"),
            System.getProperty("os.version"),
            System.getProperty("os.arch"),
            runtime.availableProcessors(),
            runtime.freeMemory(),
            runtime.totalMemory(),
            runtime.maxMemory(),
            System.getProperty("user.name")
        )
    }
}

data class InfoCheckResponse(
    val javaVmVendor: String,
    val javaVmVersion: String,
    val osName: String,
    val osVersion: String,
    val osArch: String,
    val availableProcessors: Int,
    val freeMemory: Long,
    val totalMemory: Long,
    val maxMemory: Long,
    val userName: String
)
