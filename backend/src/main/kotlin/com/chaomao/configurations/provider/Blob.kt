package com.chaomao.configurations.provider

import java.nio.channels.ReadableByteChannel
import java.nio.channels.WritableByteChannel

interface Blob {
    fun openRead(): ReadableByteChannel
    fun openWrite(): WritableByteChannel
}
