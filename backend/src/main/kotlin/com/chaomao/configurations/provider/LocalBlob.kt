package com.chaomao.configurations.provider

import java.io.FileOutputStream
import java.nio.channels.Channels
import java.nio.channels.ReadableByteChannel
import java.nio.channels.WritableByteChannel

class LocalBlob(private val fileOutputStream: FileOutputStream) : Blob {
    override fun openRead(): ReadableByteChannel {
        TODO("Not yet implemented")
    }

    override fun openWrite(): WritableByteChannel {
        return Channels.newChannel(fileOutputStream)
    }
}
