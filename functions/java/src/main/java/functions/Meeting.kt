package functions

import java.util.*

data class Meeting(
    val participantIds: Map<String, Boolean> = mapOf(),
    val participantNames: Map<String, String> = mapOf(),
    val participantUrls: Map<String, String> = mapOf(),
    val id: String = "",
    val name: String = "",
    val time: Date = Date(),
    val createdUserId: String = "",
    val participantCount: Long = 0,
)