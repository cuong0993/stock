package com.chaomao.configurations.provider

interface BlobProvider {
    fun createBlob(name: String): Blob
    fun getBlob(name: String): Blob
    fun deleteBlob(name: String): Any
}
