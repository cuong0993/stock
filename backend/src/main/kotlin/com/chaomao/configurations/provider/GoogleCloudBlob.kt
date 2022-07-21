package com.chaomao.configurations.provider

import java.nio.channels.ReadableByteChannel
import java.nio.channels.WritableByteChannel

class GoogleCloudBlob(private val writableByteChannel: WritableByteChannel) : Blob {
    override fun openRead(): ReadableByteChannel {
        TODO("Not yet implemented")
    }

    override fun openWrite(): WritableByteChannel {
        return writableByteChannel
    }
}
