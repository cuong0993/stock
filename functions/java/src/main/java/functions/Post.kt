package functions

import java.util.*

data class Post(
    val userName: String = "",
    val userId: String = "",
    val userPhotoUrl: String = "",
    val text: String = "",
    val commentCount: Int = 0,
    val likedUserIds: List<String> = listOf(),
    val tags: List<String> = listOf(),
    val createdDate: Date = Date(),
    val timeSlots: List<Date> = listOf(),
    val images: List<String> = listOf(),
    val id: String = "",
)