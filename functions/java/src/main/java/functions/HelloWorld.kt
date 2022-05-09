package functions

import com.google.cloud.functions.HttpFunction
import com.google.cloud.functions.HttpRequest
import com.google.cloud.functions.HttpResponse
import java.io.IOException

@Suppress("unused")
class HelloWorld : HttpFunction {
    @Throws(IOException::class)
    override fun service(request: HttpRequest, response: HttpResponse) {
        val writer = response.writer
        writer.write("Hello World!")
    }
}