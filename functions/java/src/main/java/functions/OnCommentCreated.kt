package functions

import com.google.cloud.functions.Context
import com.google.cloud.functions.RawBackgroundFunction
import com.google.firebase.cloud.FirestoreClient
import com.google.firebase.messaging.FirebaseMessaging
import com.google.firebase.messaging.Message
import com.google.firebase.messaging.Notification
import com.google.gson.Gson
import com.google.gson.JsonObject
import java.util.logging.Logger

@Suppress("unused")
class OnCommentCreated : RawBackgroundFunction {
    override fun accept(json: String, context: Context) {
        val body = gson.fromJson(json, JsonObject::class.java)
        val triggerName = body.getAsJsonObject("value")["name"]
        val postId = triggerName.asString.split("/posts/").last().split("/comments/").first()
        logger.info("postId $postId")
        val db = FirestoreClient.getFirestore(firebaseApp)
        val firebaseMessaging = FirebaseMessaging.getInstance(firebaseApp)
        val post =
            db.collection("posts").document(postId).get().get().toObject(Post::class.java)!!
        logger.info("post $post")
        val data = body.getAsJsonObject("value").getAsJsonObject("fields")
        val sourceUserName = data.getAsJsonObject("userName").get("stringValue").asString
        val comment = data.getAsJsonObject("text").get("stringValue").asString
        val messages = mutableListOf<Message>()

        logger.info("Notify to userId ${post.userId}")
        val user =
            db.collection("users").document(post.userId).get().get().toObject(User::class.java)!!
        for (token in user.tokens) {
            val message =
                Message.builder().setToken(token).putAllData(mapOf("type" to "post", "id" to postId))
                    .setNotification(
                        Notification.builder().setBody(comment)
                            .setTitle("$sourceUserName has commented in your question").build()
                    )
                    .build()
            messages.add(message)
            logger.info("Token $token")
        }

        firebaseMessaging.sendAll(messages)
    }

    companion object {
        private val logger = Logger.getLogger(OnCommentCreated::class.java.name)
        private val gson = Gson()
    }
}