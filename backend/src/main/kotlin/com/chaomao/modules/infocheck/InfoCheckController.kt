package com.chaomao.modules.infocheck

class InfoCheckController {

    fun get(): String {
        val runtime = Runtime.getRuntime()
        val runtimeString = "Runtime.getRuntime()"
        return "java.vm.vendor ${System.getProperty("java.vm.vendor")}\n" +
            "java.vm.version ${System.getProperty("os.name")}\n" +
            "os.name ${System.getProperty("os.name")}\n" +
            "os.version ${System.getProperty("os.version")}\n" +
            "os.arch ${System.getProperty("os.arch")}\n" +
            "$runtimeString.availableProcessors(): ${runtime.availableProcessors()}\n" +
            "$runtimeString.freeMemory(): ${runtime.freeMemory()}\n" +
            "$runtimeString.totalMemory(): ${runtime.totalMemory()}\n" +
            "$runtimeString.maxMemory(): ${runtime.maxMemory()}\n" +
            "System.getProperty(\"user.name\"): ${System.getProperty("user.name")}\n"
    }
}
