package com.chaomao.modules.analyze

import com.chaomao.configurations.getLogger
import com.chaomao.configurations.plugins.getKoinInstance
import com.chaomao.configurations.provider.BlobProvider
import com.google.auth.oauth2.GoogleCredentials
import com.google.auth.oauth2.ServiceAccountCredentials
import com.google.cloud.firestore.FirestoreOptions
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileInputStream
import java.net.URL
import java.nio.ByteBuffer
import java.nio.file.Files
import java.nio.file.Paths
import java.time.Instant
import java.time.LocalDate
import java.time.ZoneId
import java.time.format.DateTimeFormatter
import java.util.*
import java.util.zip.ZipInputStream

fun post(): AnalyzeResponse {
    val requestId = UUID.randomUUID().toString()
    return AnalyzeResponse(
        requestId,
        "completed",
        Instant.now().toString()
    )
}

class AnalyzeController {
    private val logger = getLogger()
    private val isDevelopment = System.getProperty("io.ktor.development").toBoolean()
    private val blobProvider: BlobProvider = getKoinInstance()

    fun process(param: AnalyzeRequestBody) {
        val utcZoneId = ZoneId.of("UTC")
        val analyzeDateTime = (param.date ?: LocalDate.now()).atStartOfDay(utcZoneId)
        logger.info("Trying to analyze the market at $analyzeDateTime")
        val credentialInputStream = System.getenv("SERVICE_ACCOUNT_JSON").byteInputStream()
        val credential =
            GoogleCredentials.fromStream(credentialInputStream)
                .createScoped(
                    listOf(
                        "https://www.googleapis.com/auth/datastore",
                        "https://www.googleapis.com/auth/devstorage.read_write"
                    )
                ) as ServiceAccountCredentials
        credentialInputStream.close()
        val xssfWorkbook =
            XSSFWorkbook().apply {
                createSheet("Analysis").apply {
                    createFreezePane(3, 1, 3, 1)
                    createRow(0).apply {
                        var cellIndex = 0
                        createCell(cellIndex++).setCellValue("Ticker")
                        createCell(cellIndex++).setCellValue("Name")
                        createCell(cellIndex++).setCellValue("IndustryName")
                        createCell(cellIndex++).setCellValue("Exchange")
                        createCell(cellIndex++).setCellValue("Close price")
                        createCell(cellIndex++).setCellValue("Volume")
                        createCell(cellIndex++).setCellValue("% Price")
                        createCell(cellIndex++).setCellValue("% Price 10 days")
                        createCell(cellIndex++).setCellValue("(H-L)/(C-L)")
                        createCell(cellIndex++).setCellValue("Reversal Likely")
                        createCell(cellIndex++).setCellValue("Spread price/ avg Spread price")
                        createCell(cellIndex++).setCellValue("V/avgV")
                        createCell(cellIndex++).setCellValue("Signal")
                        createCell(cellIndex++).setCellValue("Short term trend")
                        createCell(cellIndex++).setCellValue("Mid term trend")
                        createCell(cellIndex++).setCellValue("Long term trend")
                        createCell(cellIndex++).setCellValue("RSI")
                        createCell(cellIndex++).setCellValue("MACD")
                        createCell(cellIndex).setCellValue("MACD/Signal")
                    }
                }
            }
        val db = FirestoreOptions.newBuilder().setCredentials(credential).build().service

        val companies =
            db.collection("companies").whereIn("Exchange", listOf("HOSE", "HNX", "UPCoM")).get()
                .get().documents.map { it.toObject(Company::class.java) }
        val companyCodes = companies.map { it.Code }
        var currentTicker = ""
        val dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMdd")
        var stockDataController: StockDataController? = null

        val file = File("amibroker_all_data.txt")
        val dataInputStream = if (!file.exists()) {
            logger.info("Analyze remote data")
            val zipInputStream = ZipInputStream(
                URL("http://www.cophieu68.vn/export/metastock_all.php").openStream()
            ).apply {
                nextEntry.apply {
                    logger.info("entry: ${this?.name}, ${this?.size}")
                }
            }
            if (isDevelopment) {
                Files.copy(zipInputStream, Paths.get("amibroker_all_data.txt"))
            }
            zipInputStream
        } else {
            logger.info("Analyze local data")
            FileInputStream(file)
        }
        val scanner = Scanner(dataInputStream)
        // Skip header
        scanner.nextLine()
        while (scanner.hasNextLine()) {
            val line = scanner.nextLine()
            val fields = line.split(",")
            if (currentTicker != fields[0]) {
                // FIXME Trick for analyze 1 stock only
                // if (stockDataController != null) break
                stockDataController?.writeDown(
                    analyzeDateTime,
                    xssfWorkbook,
                    companies.findLast { it.Code == stockDataController!!.name }!!
                )
                currentTicker = fields[0]
                logger.info("Analyzing $currentTicker")
                stockDataController = if (companyCodes.contains(currentTicker)) {
                    StockDataController(currentTicker)
                } else {
                    null
                }
            }
            if (stockDataController != null) {
                val currentDate = LocalDate.parse(fields[1], dateTimeFormatter).atStartOfDay(utcZoneId)
                val open = fields[2].toDouble()
                val high = fields[3].toDouble()
                val low = fields[4].toDouble()
                val close = fields[5].toDouble()
                val volume = fields[6].toBigInteger()
                stockDataController.addBar(currentDate, open, high, low, close, volume)
            }
        }
        stockDataController?.writeDown(
            analyzeDateTime,
            xssfWorkbook,
            companies.findLast { it.Code == stockDataController.name }!!
        )

        dataInputStream.close()

        val time = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(analyzeDateTime)
        val fileName = "$time.xlsx"
        val byteArrayOutputStream = ByteArrayOutputStream()
        xssfWorkbook.write(byteArrayOutputStream)
        byteArrayOutputStream.close()
        xssfWorkbook.close()

        val blob = blobProvider.createBlob(
            "report/$fileName"
        )
        val writableByteChannel = blob.openWrite()
        writableByteChannel.write(ByteBuffer.wrap(byteArrayOutputStream.toByteArray()))
        writableByteChannel.close()
    }
}

data class AnalyzeRequestBody(
    val date: LocalDate?
)

data class AnalyzeResponse(
    val id: String,
    val state: String,
    val requested_at: String
)
