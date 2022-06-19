package functions

import com.google.cloud.functions.Context
import com.google.cloud.functions.RawBackgroundFunction
import com.google.gson.Gson
import com.google.gson.JsonObject
import java.util.*
import java.util.logging.Logger

@Suppress("unused")
class OnUserSignUp : RawBackgroundFunction {
    override fun accept(json: String, context: Context) {
        val body = gson.fromJson(json, JsonObject::class.java)
        logger.info("Body $body")
        if (body != null && body.has("uid")) {
            val uid = body["uid"].asString
            val docRef = db.collection("users").document(uid)
            val user = User(
                id = uid,
                name = body["displayName"]?.asString ?: "Anonymous",
                photoUrl = body["photoURL"]?.asString ?: "",
                creationTime = Date()
            )
            docRef.set(user).get()
            logger.info("Create profile success $uid")
        }
    }

    companion object {
        private val logger = Logger.getLogger(OnUserSignUp::class.java.name)
        private val gson = Gson()
    }
}
