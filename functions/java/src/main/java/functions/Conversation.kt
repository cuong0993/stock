package functions

data class Conversation(
    val participantIds: Map<String, Boolean> = mapOf(),
    val lastViews: Map<String, Long> = mapOf(),
    val id: String = "",
    val participantCount: Long = 0,
)