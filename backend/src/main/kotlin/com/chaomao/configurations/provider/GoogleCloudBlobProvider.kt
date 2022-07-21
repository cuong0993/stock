package com.chaomao.configurations.provider

import com.google.auth.oauth2.GoogleCredentials
import com.google.auth.oauth2.ServiceAccountCredentials
import com.google.cloud.storage.BlobId
import com.google.cloud.storage.BlobInfo
import com.google.cloud.storage.Storage
import com.google.cloud.storage.StorageOptions

class GoogleCloudBlobProvider : BlobProvider {
    private val storage: Storage
    private val bucket: String
    init {
        val credentialInputStream = System.getenv("SERVICE_ACCOUNT_JSON").byteInputStream()
        val credential =
            GoogleCredentials.fromStream(credentialInputStream)
                .createScoped(
                    listOf(
                        "https://www.googleapis.com/auth/datastore",
                        "https://www.googleapis.com/auth/devstorage.read_write"
                    )
                ) as ServiceAccountCredentials
        credentialInputStream.close()
        bucket = "${credential.projectId}.appspot.com"
        storage = StorageOptions.newBuilder().setCredentials(credential).build().service
    }
    override fun createBlob(name: String): Blob {
        val writeChannel = storage.writer(BlobInfo.newBuilder(BlobId.of(bucket, name)).build())
        return GoogleCloudBlob(writeChannel)
    }

    override fun getBlob(name: String): Blob {
        TODO("Not yet implemented")
    }

    override fun deleteBlob(bname: String): Any {
        TODO("Not yet implemented")
    }
}
