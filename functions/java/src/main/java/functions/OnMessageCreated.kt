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
class OnMessageCreated : RawBackgroundFunction {
    override fun accept(json: String, context: Context) {
        val body = gson.fromJson(json, JsonObject::class.java)
        val triggerName = body.getAsJsonObject("value")["name"]
        val messageInConversationPath = triggerName.asString.split("/documents/conversations/").last()
        val conversationId = messageInConversationPath.split("/messages/").first()
        logger.info("conversationId $conversationId")
        val messageId = messageInConversationPath.split("/messages/").last()
        logger.info("messageId $messageId")
        val db = FirestoreClient.getFirestore(firebaseApp)
        val firebaseMessaging = FirebaseMessaging.getInstance(firebaseApp)
        val conversation =
            db.collection("conversations").document(conversationId).get().get().toObject(Conversation::class.java)!!
        val data = body.getAsJsonObject("value").getAsJsonObject("fields")
        val sourceUserId = data.getAsJsonObject("userId").get("stringValue").asString
        logger.info("Source userId $sourceUserId")
        val sourceUserName = data.getAsJsonObject("userName").get("stringValue").asString
        val text = data.getAsJsonObject("text").get("stringValue").asString
        val messages = mutableListOf<Message>()
        for (userId in conversation.participantIds.keys) {
            if (userId != sourceUserId) {
                logger.info("Notify to userId $userId")
                val user =
                    db.collection("users").document(userId).get().get().toObject(User::class.java)!!
                for (token in user.tokens) {
                    val message =
                        Message.builder().setToken(token)
                            .putAllData(mapOf("type" to "conversation", "id" to conversationId))
                            .setNotification(Notification.builder().setBody(text).setTitle(sourceUserName).build())
                            .build()
                    messages.add(message)
                    logger.info("Token $token")
                }
            }
        }
        firebaseMessaging.sendAll(messages)
    }

    companion object {
        private val logger = Logger.getLogger(OnMessageCreated::class.java.name)
        private val gson = Gson()
    }
}