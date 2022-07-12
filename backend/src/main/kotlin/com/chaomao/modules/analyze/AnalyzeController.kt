package com.chaomao.modules.analyze

import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport
import com.google.api.client.http.FileContent
import com.google.api.client.json.gson.GsonFactory
import com.google.api.services.drive.Drive
import com.google.api.services.drive.DriveScopes
import com.google.auth.http.HttpCredentialsAdapter
import com.google.auth.oauth2.GoogleCredentials
import com.google.auth.oauth2.ServiceAccountCredentials
import com.google.cloud.firestore.FirestoreOptions
import com.google.cloud.storage.BlobId
import com.google.cloud.storage.BlobInfo
import com.google.cloud.storage.StorageOptions
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.slf4j.LoggerFactory
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.net.URL
import java.nio.file.Files
import java.nio.file.Paths
import java.text.SimpleDateFormat
import java.time.Instant
import java.time.LocalDate
import java.time.ZoneId
import java.time.ZoneOffset
import java.time.ZonedDateTime
import java.time.format.DateTimeFormatter
import java.util.*
import java.util.zip.ZipInputStream

fun post(): AnalyzeResponse {
    val requestId = UUID.randomUUID().toString()
    val credentialInputStream = System.getenv("SERVICE_ACCOUNT_JSON").byteInputStream()
    val credential =
        GoogleCredentials.fromStream(credentialInputStream)
            .createScoped(
                listOf(
                    "https://www.googleapis.com/auth/datastore",
                    "https://www.googleapis.com/auth/devstorage.read_write",
                    DriveScopes.DRIVE
                )
            ) as ServiceAccountCredentials
    credentialInputStream.close()
    val googleDriveService =
        Drive.Builder(
            GoogleNetHttpTransport.newTrustedTransport(),
            GsonFactory.getDefaultInstance(),
            HttpCredentialsAdapter(credential)
        )
            .setApplicationName("CP")
            .build()
    val fileId =
        (googleDriveService.files().generateIds().setCount(1).execute()["ids"] as ArrayList<*>)[0].toString()
    return AnalyzeResponse(
        requestId,
        fileId,
        "drive.google.com/uc?id=$fileId&export=download",
        "pending",
        Instant.now().toString()
    )
}
class AnalyzeController {
    private val logger = LoggerFactory.getLogger("AnalyzeController")

    fun process(
        param: AnalyzeRequestBody,
        fileId: String
    ) {
        val date = if (param.date != null) {
            SimpleDateFormat("yyyy-MM-dd").apply { timeZone = TimeZone.getTimeZone("UTC") }
                .parse(param.date)
        } else {
            Date()
        }
        val credentialInputStream = System.getenv("SERVICE_ACCOUNT_JSON").byteInputStream()
        val credential =
            GoogleCredentials.fromStream(credentialInputStream)
                .createScoped(
                    listOf(
                        "https://www.googleapis.com/auth/datastore",
                        "https://www.googleapis.com/auth/devstorage.read_write",
                        DriveScopes.DRIVE
                    )
                ) as ServiceAccountCredentials
        credentialInputStream.close()
        val googleDriveService =
            Drive.Builder(
                GoogleNetHttpTransport.newTrustedTransport(),
                GsonFactory.getDefaultInstance(),
                HttpCredentialsAdapter(credential)
            )
                .setApplicationName("CP")
                .build()
        val zonedDateTime = ZonedDateTime.ofInstant(date.toInstant(), ZoneId.of("UTC"))
        val xssfWorkbook =
            XSSFWorkbook().apply {
                createSheet("Volume Price Analysis").apply {
                    createFreezePane(3, 1, 3, 1)
                    createRow(0).apply {
                        var cellIndex = 0
                        createCell(cellIndex++).setCellValue("Date")
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
        val theDir = File("./ohlcv")
        if (!theDir.exists()) {
            theDir.mkdirs()
        }
        val db = FirestoreOptions.newBuilder().setCredentials(credential).build().service

        val companies =
            db.collection("companies").whereIn("Exchange", listOf("HOSE", "HNX", "UPCoM")).get()
                .get().documents.map { it.toObject(Company::class.java) }
        val companyCodes = companies.map { it.Code }
        var currentTicker = ""
        val dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMdd")
        var stockDataController: StockDataController? = null
        var lastDate = ZonedDateTime.ofInstant(Instant.ofEpochSecond(0), ZoneOffset.UTC)

        val file = File("amibroker_all_data.txt")
        val dataInputStream = if (!file.exists()) {
            logger.debug("Analyze remote data")
            ZipInputStream(
                URL("http://www.cophieu68.vn/export/metastock_all.php").openStream()
            ).apply {
                nextEntry.apply {
                    logger.debug("entry: ${this?.name}, ${this?.size}")
                }
            }
        } else {
            logger.debug("Analyze local data")
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
                    zonedDateTime,
                    xssfWorkbook,
                    companies.findLast { it.Code == stockDataController!!.name }!!
                )
                currentTicker = fields[0]
                logger.debug(currentTicker)
                stockDataController = if (companyCodes.contains(currentTicker)) {
                    StockDataController(currentTicker)
                } else {
                    null
                }
            }
            if (stockDataController != null) {
                val currentDate = LocalDate.parse(fields[1], dateTimeFormatter).atStartOfDay(ZoneId.of("UTC"))
                val open = fields[2].toDouble()
                val high = fields[3].toDouble()
                val low = fields[4].toDouble()
                val close = fields[5].toDouble()
                val volume = fields[6].toBigInteger()
                if (currentDate > lastDate) {
                    lastDate = currentDate
                }
                stockDataController.addBar(currentDate, open, high, low, close, volume)
            }
        }
        stockDataController?.writeDown(
            zonedDateTime,
            xssfWorkbook,
            companies.findLast { it.Code == stockDataController.name }!!
        )

        dataInputStream.close()

        val time = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(minOf(zonedDateTime, lastDate))
        val fileName = "VPA-$time.xlsx"
        val fileOutputStream = FileOutputStream(fileName)
        xssfWorkbook.write(fileOutputStream)
        fileOutputStream.close()
        xssfWorkbook.close()

        val fileMetadata = com.google.api.services.drive.model.File().apply {
            name = fileName
            id = fileId
            parents = listOf(System.getenv("DRIVE_FOLDER_ID"))
            mimeType = "application/vnd.ms-excel"
        }
        val mediaContent = FileContent("application/vnd.ms-excel", File(fileName))
        googleDriveService.files().create(fileMetadata, mediaContent).execute()

        val storage = StorageOptions.newBuilder().setCredentials(credential).build().service
        Files.walk(Paths.get("./ohlcv")).forEach {
            if (it.toFile().isFile) {
                logger.debug("Uploading ${it.fileName}")
                storage.create(
                    BlobInfo.newBuilder(
                        BlobId.of(
                            "${credential.projectId}.appspot.com",
                            "ohlcv/${it.fileName}"
                        )
                    )
                        .build(),
                    Files.readAllBytes(
                        Paths.get(it.toUri())
                    )
                )
            }
        }
    }
}

data class AnalyzeRequestBody(
    val date: String?
)

data class AnalyzeResponse(
    val id: String,
    val file_id: String,
    val file_url: String,
    val state: String,
    val requested_at: String
)
