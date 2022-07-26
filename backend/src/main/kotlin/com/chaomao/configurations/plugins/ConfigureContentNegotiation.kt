package com.chaomao.configurations.plugins

import com.google.gson.TypeAdapter
import com.google.gson.stream.JsonReader
import com.google.gson.stream.JsonWriter
import io.ktor.serialization.gson.gson
import io.ktor.server.application.Application
import io.ktor.server.application.install
import io.ktor.server.plugins.contentnegotiation.ContentNegotiation
import java.time.LocalDate
import java.time.format.DateTimeFormatter

fun Application.configureContentNegotiation() {
    install(ContentNegotiation) {
        gson {
            setPrettyPrinting()
            registerTypeAdapter(
                LocalDate::class.java,
                object : TypeAdapter<LocalDate>() {
                    val format = DateTimeFormatter.ISO_DATE
                    override fun write(out: JsonWriter, value: LocalDate) {
                        out.value(format.format(value))
                    }

                    override fun read(input: JsonReader): LocalDate = LocalDate.parse(input.nextString(), format)
                }
            )
        }
    }
}
