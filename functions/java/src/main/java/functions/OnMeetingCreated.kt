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
class OnMeetingCreated : RawBackgroundFunction {
    override fun accept(json: String, context: Context) {
        val body = gson.fromJson(json, JsonObject::class.java)
        val triggerName = body.getAsJsonObject("value")["name"]
        val meetingId = triggerName.asString.split("/documents/meetings/").last()
        logger.info("meetingId $meetingId")
        val db = FirestoreClient.getFirestore(firebaseApp)
        val firebaseMessaging = FirebaseMessaging.getInstance(firebaseApp)
        val meeting =
            db.collection("meetings").document(meetingId).get().get().toObject(Meeting::class.java)!!
        logger.info("meeting $meeting")
        val messages = mutableListOf<Message>()
        val createdUserName = meeting.participantNames[meeting.createdUserId]
        for (userId in meeting.participantIds.keys) {
            if (userId != meeting.createdUserId) {
                logger.info("Notify to userId $userId")
                val user =
                    db.collection("users").document(userId).get().get().toObject(User::class.java)!!
                for (token in user.tokens) {
                    val message =
                        Message.builder().setToken(token).putAllData(mapOf("type" to "meeting", "id" to meetingId))
                            .setNotification(
                                Notification.builder().setBody(meeting.name)
                                    .setTitle("$createdUserName wants to meeting").build()
                            )
                            .build()
                    messages.add(message)
                    logger.info("Token $token")
                }
            }
        }
        firebaseMessaging.sendAll(messages)
    }

    companion object {
        private val logger = Logger.getLogger(OnMeetingCreated::class.java.name)
        private val gson = Gson()
    }
}