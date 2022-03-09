package functions

import java.util.*

data class User(
    val id: String = "",
    val name: String = "",
    val photoUrl: String = "",
    val tokens: List<String> = listOf(),
    val creationTime: Date = Date(),
)