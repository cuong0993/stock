package com.chaomao.configurations.provider

import java.io.File
import java.io.FileOutputStream

class LocalBlobProvider : BlobProvider {
    override fun createBlob(name: String): Blob {
        val file = File(name)
        file.parentFile?.mkdirs()
        return LocalBlob(FileOutputStream(file))
    }

    override fun getBlob(name: String): Blob {
        TODO("Not yet implemented")
    }

    override fun deleteBlob(name: String): Any {
        TODO("Not yet implemented")
    }
}
