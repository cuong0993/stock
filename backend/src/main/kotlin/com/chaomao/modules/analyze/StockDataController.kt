package com.chaomao.modules.analyze

import com.chaomao.configurations.provider.BlobProvider
import org.apache.commons.csv.CSVFormat
import org.apache.commons.csv.CSVPrinter
import org.apache.poi.common.usermodel.HyperlinkType
import org.apache.poi.ss.usermodel.FillPatternType
import org.apache.poi.ss.usermodel.IndexedColors
import org.apache.poi.xssf.usermodel.XSSFFont
import org.apache.poi.xssf.usermodel.XSSFHyperlink
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.koin.java.KoinJavaComponent
import org.ta4j.core.BaseBarSeries
import org.ta4j.core.indicators.EMAIndicator
import org.ta4j.core.indicators.MACDIndicator
import org.ta4j.core.indicators.MMAIndicator
import org.ta4j.core.indicators.RSIIndicator
import org.ta4j.core.indicators.SMAIndicator
import org.ta4j.core.indicators.helpers.BooleanTransformIndicator
import org.ta4j.core.indicators.helpers.ClosePriceIndicator
import org.ta4j.core.indicators.helpers.DifferenceIndicator
import org.ta4j.core.indicators.helpers.GainIndicator
import org.ta4j.core.indicators.helpers.HighPriceIndicator
import org.ta4j.core.indicators.helpers.HighestValueIndicator
import org.ta4j.core.indicators.helpers.LossIndicator
import org.ta4j.core.indicators.helpers.LowPriceIndicator
import org.ta4j.core.indicators.helpers.LowestValueIndicator
import org.ta4j.core.indicators.helpers.PreviousValueIndicator
import org.ta4j.core.indicators.helpers.PriceVariationIndicator
import org.ta4j.core.indicators.helpers.TransformIndicator
import org.ta4j.core.indicators.helpers.VolumeIndicator
import org.ta4j.core.indicators.statistics.SimpleLinearRegressionIndicator
import org.ta4j.core.num.DecimalNum
import java.io.ByteArrayOutputStream
import java.io.OutputStreamWriter
import java.nio.ByteBuffer
import java.time.ZonedDateTime
import java.time.format.DateTimeFormatter

class StockDataController(val name: String) {
    companion object {
        val DATE_FORMAT: DateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMdd")
    }

    private val barSeries = BaseBarSeries(name)
    private val byteArrayOutputStream = ByteArrayOutputStream()
    private val csvFilePrinter = CSVPrinter(OutputStreamWriter(byteArrayOutputStream), CSVFormat.DEFAULT)
    private val blobProvider: BlobProvider = KoinJavaComponent.getKoin().get()

    fun addBar(
        endTime: ZonedDateTime,
        openPrice: Number,
        highPrice: Number,
        lowPrice: Number,
        closePrice: Number,
        volume: Number?
    ) {
        barSeries.addBar(endTime, openPrice, highPrice, lowPrice, closePrice, volume)
        csvFilePrinter.printRecord(DATE_FORMAT.format(endTime), openPrice, highPrice, lowPrice, closePrice, volume)
    }

    fun writeDown(date: ZonedDateTime, xssfWorkbook: XSSFWorkbook, company: Company) {
        byteArrayOutputStream.flush()
        byteArrayOutputStream.close()
        csvFilePrinter.close()

        val blob = blobProvider.createBlob(
            "ohlcv/$name.csv"
        )
        val writableByteChannel = blob.openWrite()
        writableByteChannel.write(ByteBuffer.wrap(byteArrayOutputStream.toByteArray()))
        writableByteChannel.close()

        var index = barSeries.endIndex
        while (index >= 0) {
            val bar = barSeries.getBar(index)
            val time = bar.endTime
            if (time <= date) {
                break
            }
            index--
        }
        if (index < 0) {
            return
        }
        val bar = barSeries.getBar(index)
        val volume = VolumeIndicator(barSeries)
        val volumeSma = SMAIndicator(volume, 30)
        val previousVolume = PreviousValueIndicator(volume)
        val isVolumeUp =
            BooleanTransformIndicator(
                GainIndicator(volume),
                BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
            )
        val isVolumeDecrease =
            BooleanTransformIndicator(
                LossIndicator(volume),
                BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
            )
        val isTwoDaysLowVol = TwoDaysLowVolIndicator(barSeries)
        val isUltraHighVol =
            BooleanTransformIndicator(
                DifferenceIndicator(volume, TransformIndicator.multiply(volumeSma, 2)),
                BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
            )
        val isHighVol =
            BooleanTransformIndicator(
                DifferenceIndicator(volume, volumeSma),
                BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
            )
        val isLowVol =
            BooleanTransformIndicator(
                DifferenceIndicator(volume, volumeSma),
                BooleanTransformIndicator.BooleanTransformSimpleType.isNegative
            )

        val highPrice = HighPriceIndicator(barSeries)
        val lowPrice = LowPriceIndicator(barSeries)
        val closePrice = ClosePriceIndicator(barSeries)
        val priceSpread = DifferenceIndicator(highPrice, LowPriceIndicator(barSeries))
        val avgPriceSpread = MMAIndicator(priceSpread, 30)
        val isHighWidePriceSpread =
            BooleanTransformIndicator(
                DifferenceIndicator(priceSpread, TransformIndicator.multiply(avgPriceSpread, 1.5)),
                BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
            )
        val isWidePriceSpread =
            BooleanTransformIndicator(
                DifferenceIndicator(priceSpread, avgPriceSpread),
                BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
            )
        val isNarrowPriceSpread =
            BooleanTransformIndicator(
                DifferenceIndicator(priceSpread, TransformIndicator.multiply(avgPriceSpread, 0.7)),
                BooleanTransformIndicator.BooleanTransformSimpleType.isNegative
            )

        val isClosePriceUp =
            BooleanTransformIndicator(
                GainIndicator(closePrice),
                BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
            )
        val isPreviousPriceUp = PreviousBooleanIndicator(isClosePriceUp)
        val isPriceDown =
            BooleanTransformIndicator(
                LossIndicator(closePrice),
                BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
            )
        val isPreviousPriceDown = PreviousBooleanIndicator(isPriceDown)
        val isPriceHighest5days =
            BooleanTransformIndicator(
                DifferenceIndicator(highPrice, HighestValueIndicator(highPrice, 5)),
                BooleanTransformIndicator.BooleanTransformSimpleType.isZero
            )
        val isLowestPrice5Days =
            BooleanTransformIndicator(
                DifferenceIndicator(lowPrice, LowestValueIndicator(lowPrice, 5)),
                BooleanTransformIndicator.BooleanTransformSimpleType.isZero
            )

        // Check if the close is in the Highs/Lows/Middle of the bar.
        val closePriceRatio = ClosePriceRatioIndicator(barSeries)
        val priceVariation = PriceVariationIndicator(barSeries)
        val isDownLowClosePrice =
            BooleanTransformIndicator(
                closePriceRatio,
                DecimalNum.valueOf(0.25),
                BooleanTransformIndicator.BooleanTransformType.isLessThan
            )
        val isDownClosePrice =
            BooleanTransformIndicator(
                closePriceRatio,
                DecimalNum.valueOf(0.5),
                BooleanTransformIndicator.BooleanTransformType.isLessThan
            )
        val isMidClosePrice =
            AndLogicIndicator(
                BooleanTransformIndicator(
                    closePriceRatio,
                    DecimalNum.valueOf(0.4545),
                    BooleanTransformIndicator.BooleanTransformType.isGreaterThan
                ),
                BooleanTransformIndicator(
                    closePriceRatio,
                    DecimalNum.valueOf(0.5555),
                    BooleanTransformIndicator.BooleanTransformType.isLessThan
                )
            )
        val isUpClosePrice =
            BooleanTransformIndicator(
                closePriceRatio,
                DecimalNum.valueOf(0.5),
                BooleanTransformIndicator.BooleanTransformType.isGreaterThan
            )
        val isHighClosePrice =
            BooleanTransformIndicator(
                closePriceRatio,
                DecimalNum.valueOf(0.7),
                BooleanTransformIndicator.BooleanTransformType.isGreaterThan
            )

        val fiveDaysClosePriceSma = SMAIndicator(ClosePriceIndicator(barSeries), 5)
        val longTermTrendSlope =
            SimpleLinearRegressionIndicator(
                fiveDaysClosePriceSma,
                40,
                SimpleLinearRegressionIndicator.SimpleLinearRegressionType.SLOPE
            )
        val middleTermTrendSlope =
            SimpleLinearRegressionIndicator(
                fiveDaysClosePriceSma,
                15,
                SimpleLinearRegressionIndicator.SimpleLinearRegressionType.SLOPE
            )
        val shortTermTrendSlope =
            SimpleLinearRegressionIndicator(
                fiveDaysClosePriceSma,
                5,
                SimpleLinearRegressionIndicator.SimpleLinearRegressionType.SLOPE
            )
        val isShortTermDownTrend =
            BooleanTransformIndicator(
                shortTermTrendSlope,
                BooleanTransformIndicator.BooleanTransformSimpleType.isNegative
            )
        val isShortTermUpTrend =
            BooleanTransformIndicator(
                shortTermTrendSlope,
                BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
            )
        val isMiddleTermDownTrend =
            BooleanTransformIndicator(
                middleTermTrendSlope,
                BooleanTransformIndicator.BooleanTransformSimpleType.isNegative
            )
        val isMiddleTermUpTrend =
            BooleanTransformIndicator(
                middleTermTrendSlope,
                BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
            )
        val isLongTermDownTrend =
            BooleanTransformIndicator(
                longTermTrendSlope,
                BooleanTransformIndicator.BooleanTransformSimpleType.isNegative
            )
        val isLongTermUpTrend =
            BooleanTransformIndicator(
                longTermTrendSlope,
                BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
            )

        val isUpThrustPrice =
            AndLogicIndicator(
                AndLogicIndicator(isHighWidePriceSpread, isDownClosePrice),
                isShortTermUpTrend
            )
        val isPreviousUpThrustPriceAndPriceDown =
            AndLogicIndicator(PreviousBooleanIndicator(isUpThrustPrice), isPriceDown)
        val isPreviousUpThrustPriceAndPriceDownAndVolumeUp =
            AndLogicIndicator(isPreviousUpThrustPriceAndPriceDown, isVolumeUp)
        val isUpThrustPriceAndUltraHighVolume = AndLogicIndicator(isUpThrustPrice, isUltraHighVol)
        val isConfirmedUpThrust =
            OrLogicIndicator(
                OrLogicIndicator(
                    isPreviousUpThrustPriceAndPriceDown,
                    isPreviousUpThrustPriceAndPriceDownAndVolumeUp
                ),
                isUpThrustPriceAndUltraHighVolume
            )
        val isPriceHighest10days = BooleanTransformIndicator(
            DifferenceIndicator(highPrice, HighestValueIndicator(highPrice, 10)),
            BooleanTransformIndicator.BooleanTransformSimpleType.isZero
        )
        val isReversalLikely = AndLogicIndicator(
            AndLogicIndicator(
                AndLogicIndicator(
                    AndLogicIndicator(
                        AndLogicIndicator(
                            AndLogicIndicator(
                                AndLogicIndicator(
                                    BooleanTransformIndicator(
                                        DifferenceIndicator(previousVolume, volumeSma),
                                        BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
                                    ),
                                    isPreviousPriceUp
                                ),
                                PreviousBooleanIndicator(isHighWidePriceSpread)
                            ),
                            isPriceDown
                        ),
                        isDownClosePrice
                    ),
                    isHighWidePriceSpread
                ),
                isLongTermUpTrend
            ),
            isPriceHighest10days
        )

        val isPseudoUpThrust =
            AndLogicIndicator(
                AndLogicIndicator(
                    AndLogicIndicator(
                        AndLogicIndicator(
                            AndLogicIndicator(
                                isPreviousPriceUp,
                                BooleanTransformIndicator(
                                    DifferenceIndicator(
                                        previousVolume,
                                        TransformIndicator.multiply(volumeSma, 1.5)
                                    ),
                                    BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
                                )
                            ),
                            isPriceDown
                        ),
                        isDownClosePrice
                    ),
                    NotLogicIndicator(isHighWidePriceSpread)
                ),
                NotLogicIndicator(isUpThrustPrice)
            )

        val isPseudoUpThrustConfirmation =
            AndLogicIndicator(
                AndLogicIndicator(
                    AndLogicIndicator(PreviousBooleanIndicator(isPseudoUpThrust), isPriceDown),
                    isDownClosePrice
                ),
                NotLogicIndicator(isUpThrustPrice)
            )
        val isWeakness =
            AndLogicIndicator(
                AndLogicIndicator(
                    AndLogicIndicator(
                        AndLogicIndicator(
                            AndLogicIndicator(
                                AndLogicIndicator(isPreviousPriceUp, isPriceHighest5days),
                                isPriceDown
                            ),
                            OrLogicIndicator(isDownClosePrice, isMidClosePrice)
                        ),
                        isHighVol
                    ),
                    NotLogicIndicator(isHighWidePriceSpread)
                ),
                NotLogicIndicator(isPseudoUpThrust)
            )

        val isPriceUpAndClosePriceNearHighestPrice = OrLogicIndicator(isUpClosePrice, isMidClosePrice)
        val isAboveAvgVol =
            BooleanTransformIndicator(
                DifferenceIndicator(volume, TransformIndicator.multiply(volumeSma, 1.5)),
                BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
            )
        val isStrengthInMiddleDownTrendVolUp =
            AndLogicIndicator(
                AndLogicIndicator(
                    AndLogicIndicator(
                        AndLogicIndicator(
                            AndLogicIndicator(isVolumeUp, isPreviousPriceDown),
                            isClosePriceUp
                        ),
                        isPriceUpAndClosePriceNearHighestPrice
                    ),
                    isShortTermDownTrend
                ),
                isMiddleTermDownTrend
            )
        val isStrengthInLongDownTrendVolUp =
            AndLogicIndicator(isStrengthInMiddleDownTrendVolUp, isLongTermDownTrend)
        val isStrengthInLongDownTrendVolExplode =
            AndLogicIndicator(
                AndLogicIndicator(
                    AndLogicIndicator(
                        AndLogicIndicator(
                            AndLogicIndicator(
                                AndLogicIndicator(isAboveAvgVol, isPreviousPriceDown),
                                isClosePriceUp
                            ),
                            isPriceUpAndClosePriceNearHighestPrice
                        ),
                        isShortTermDownTrend
                    ),
                    isMiddleTermDownTrend
                ),
                isLongTermDownTrend
            )
        val isStrengthInShortDownTrendPriceUpSurely =
            AndLogicIndicator(
                AndLogicIndicator(
                    AndLogicIndicator(
                        AndLogicIndicator(
                            BooleanTransformIndicator(
                                DifferenceIndicator(previousVolume, volumeSma),
                                BooleanTransformIndicator.BooleanTransformSimpleType.isNegative
                            ),
                            isClosePriceUp
                        ),
                        isHighClosePrice
                    ),
                    isHighVol
                ),
                isShortTermDownTrend
            )
        val isStrengthConfirmation =
            AndLogicIndicator(
                isClosePriceUp,
                PreviousBooleanIndicator(
                    OrLogicIndicator(
                        isStrengthInMiddleDownTrendVolUp,
                        isStrengthInLongDownTrendVolExplode
                    )
                )
            )
        val isStopVol =
            AndLogicIndicator(
                AndLogicIndicator(
                    AndLogicIndicator(isLowestPrice5Days, isPriceUpAndClosePriceNearHighestPrice),
                    isAboveAvgVol
                ),
                isLongTermDownTrend
            )
        val isNoDemand =
            AndLogicIndicator(
                AndLogicIndicator(
                    AndLogicIndicator(isClosePriceUp, isNarrowPriceSpread),
                    isTwoDaysLowVol
                ),
                isDownClosePrice
            )

        val isNoSupply =
            AndLogicIndicator(
                AndLogicIndicator(AndLogicIndicator(isPriceDown, isNarrowPriceSpread), isTwoDaysLowVol),
                isDownClosePrice
            )

        val isSupplyTest =
            AndLogicIndicator(AndLogicIndicator(isTwoDaysLowVol, isVolumeDecrease), isUpClosePrice)
        val isSupplyTestInUpTrend =
            AndLogicIndicator(
                AndLogicIndicator(
                    AndLogicIndicator(
                        AndLogicIndicator(
                            AndLogicIndicator(isLowVol, isVolumeDecrease),
                            isUpClosePrice
                        ),
                        isLongTermUpTrend
                    ),
                    isMiddleTermUpTrend
                ),
                isHighWidePriceSpread
            )
        val isSuccessfulSupplyTest =
            AndLogicIndicator(
                AndLogicIndicator(PreviousBooleanIndicator(isSupplyTest), isClosePriceUp),
                isUpClosePrice
            )

        val isDistribution =
            AndLogicIndicator(
                AndLogicIndicator(
                    AndLogicIndicator(
                        AndLogicIndicator(
                            AndLogicIndicator(
                                AndLogicIndicator(
                                    isUltraHighVol,
                                    isDownClosePrice
                                ),
                                isClosePriceUp
                            ),
                            isShortTermUpTrend
                        ),
                        isMiddleTermUpTrend
                    ),
                    NotLogicIndicator(isConfirmedUpThrust)
                ),
                NotLogicIndicator(isUpThrustPrice)
            )

        val isEffortUpMove =
            AndLogicIndicator(
                AndLogicIndicator(
                    AndLogicIndicator(
                        AndLogicIndicator(
                            AndLogicIndicator(
                                BooleanTransformIndicator(
                                    GainIndicator(highPrice),
                                    BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
                                ),
                                BooleanTransformIndicator(
                                    GainIndicator(lowPrice),
                                    BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
                                )
                            ),
                            isClosePriceUp
                        ),
                        isVolumeUp
                    ),
                    isHighClosePrice
                ),
                isWidePriceSpread
            )

        val isFailedEffortUpMove =
            AndLogicIndicator(
                PreviousBooleanIndicator(isEffortUpMove),
                OrLogicIndicator(
                    OrLogicIndicator(
                        OrLogicIndicator(isUpThrustPrice, isPreviousUpThrustPriceAndPriceDown),
                        isPreviousUpThrustPriceAndPriceDownAndVolumeUp
                    ),
                    isUpThrustPriceAndUltraHighVolume
                )
            )

        val isEffortDownMove =
            AndLogicIndicator(
                AndLogicIndicator(
                    AndLogicIndicator(
                        AndLogicIndicator(
                            AndLogicIndicator(
                                BooleanTransformIndicator(
                                    LossIndicator(highPrice),
                                    BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
                                ),
                                BooleanTransformIndicator(
                                    LossIndicator(lowPrice),
                                    BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
                                )
                            ),
                            isPriceDown
                        ),
                        isVolumeUp
                    ),
                    isDownLowClosePrice
                ),
                isWidePriceSpread
            )
        val signal =
            when {
                isUpThrustPrice.getValue(index) -> "Weakness appeared. An upthrust bar."
                isPreviousUpThrustPriceAndPriceDown.getValue(index) ->
                    "Weakness confirmed. A down bar after an upthrust."
                isPreviousUpThrustPriceAndPriceDownAndVolumeUp.getValue(index) &&
                    !isPreviousUpThrustPriceAndPriceDown.getValue(index) ->
                    "Weakness confirmed. A high volume down bar after an upthrust."
                isUpThrustPriceAndUltraHighVolume.getValue(index) ->
                    "Weakness confirmed. This upthrust at very high volume."
                isStrengthInLongDownTrendVolExplode.getValue(index) ->
                    "Strength testing. Volume explode above average. Price up. Close price near highest price"
                isStrengthInLongDownTrendVolUp.getValue(index) &&
                    !isStrengthInMiddleDownTrendVolUp.getValue(index) ->
                    "Strength testing. Volume up. Price up. Close price near highest price"
                isStrengthInMiddleDownTrendVolUp.getValue(index) &&
                    !isStrengthInLongDownTrendVolExplode.getValue(index) ->
                    "Strength testing. Volume up. Price up. Close price near highest price"
                isStrengthInShortDownTrendPriceUpSurely.getValue(index) ->
                    "Strength confirmed in down trend. Previous volume down. " +
                        "This high volume up bar closing on the high indicates strength."
                isStrengthConfirmation.getValue(index) ->
                    "Strength confirmed. The previous bar saw strength coming back. This up bar confirms strength."
                isSupplyTest.getValue(index) ->
                    "Strength testing. Test for supply. Volume down. Close price near highest price"
                isSuccessfulSupplyTest.getValue(index) ->
                    "Strength testing. An up bar closing near high after a test for supply."
                isDistribution.getValue(index) ->
                    "Weakness appeared. A high volume up bar closing down in a uptrend shows distribution."
                isPseudoUpThrust.getValue(index) -> "Weakness appeared. Pseudo upthrust."
                isPseudoUpThrustConfirmation.getValue(index) ->
                    "Weakness confirmed. A down bar closing down after a pseudo upthrust."
                isSupplyTestInUpTrend.getValue(index) -> "Strength testing. Test for supply in a uptrend."
                isWeakness.getValue(index) ->
                    "Weakness appeared. High volume down bar after an up move on high volume."
                isNoDemand.getValue(index) -> "Weakness appeared. No demand."
                isNoSupply.getValue(index) -> "Strength testing. No supply."
                isEffortUpMove.getValue(index) -> "Strength appeared. Effort to rise. Bullish sign."
                isEffortDownMove.getValue(index) -> "Weakness confirmed. Effort to fall. Bearish sign."
                isFailedEffortUpMove.getValue(index) ->
                    "Weakness confirmed. Effort to move up has failed. Bearish sign."
                isStopVol.getValue(index) ->
                    "Strength testing. Stopping volume. Normally indicates end of bearishness is nearing."
                else -> ""
            }
        val rsi = RSIIndicator(closePrice, 14)
        val macd = MACDIndicator(closePrice)
        val macdSignal = EMAIndicator(macd, 9)
        val macdDiff = DifferenceIndicator(macd, macdSignal)
        val macdSignalValue =
            OrLogicIndicator(
                AndLogicIndicator(
                    BooleanTransformIndicator(
                        GainIndicator(macdDiff),
                        BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
                    ),
                    BooleanTransformIndicator(
                        macdDiff,
                        BooleanTransformIndicator.BooleanTransformSimpleType.isZero
                    )
                ),
                BooleanTransformIndicator(
                    macdDiff,
                    BooleanTransformIndicator.BooleanTransformSimpleType.isPositive
                )
            )
        val priceChangePercent = (priceVariation.getValue(index).doubleValue() - 1) * 100

        val goodStyle =
            xssfWorkbook.createCellStyle().apply {
                fillForegroundColor = IndexedColors.LAVENDER.index
                fillPattern = FillPatternType.SOLID_FOREGROUND
            }
        val normalStyle =
            xssfWorkbook.createCellStyle().apply {
                fillForegroundColor = IndexedColors.LIGHT_YELLOW.index
                fillPattern = FillPatternType.SOLID_FOREGROUND
            }
        val upStyle =
            xssfWorkbook.createCellStyle().apply {
                fillForegroundColor = IndexedColors.BRIGHT_GREEN.index
                fillPattern = FillPatternType.SOLID_FOREGROUND
            }
        val downStyle =
            xssfWorkbook.createCellStyle().apply {
                fillForegroundColor = IndexedColors.RED.index
                fillPattern = FillPatternType.SOLID_FOREGROUND
            }
        val oopsStyle =
            xssfWorkbook.createCellStyle().apply {
                fillForegroundColor = IndexedColors.BLUE.index
                fillPattern = FillPatternType.SOLID_FOREGROUND
            }
        val linkStyle = xssfWorkbook.createCellStyle()
        val linkFont = xssfWorkbook.createFont()
        linkFont.underline = XSSFFont.U_SINGLE
        linkFont.color = IndexedColors.BLUE.index
        linkStyle.setFont(linkFont)
        val sheet = xssfWorkbook.getSheetAt(0)
        val row = sheet.createRow(sheet.lastRowNum + 1)
        var cellIndex = 0
        row.createCell(cellIndex++).setCellValue(bar.simpleDateName.removeSuffix("T00:00:00"))
        row.createCell(cellIndex++).apply {
            setCellValue(barSeries.name)
            if (priceChangePercent > 0) {
                cellStyle = upStyle
            } else if (priceChangePercent < 0) {
                cellStyle = downStyle
            }
        }
        row.createCell(cellIndex++).apply {
            setCellValue(company.Name)
            val link = xssfWorkbook.creationHelper.createHyperlink(HyperlinkType.URL) as XSSFHyperlink
            link.address = company.URL
            hyperlink = link
            cellStyle = linkStyle
        }
        row.createCell(cellIndex++).apply {
            setCellValue(company.IndustryName)
        }
        row.createCell(cellIndex++).apply {
            setCellValue(company.Exchange)
        }
        row.createCell(cellIndex++).setCellValue(closePrice.getValue(index).doubleValue())
        row.createCell(cellIndex++).setCellValue(volume.getValue(index).doubleValue())
        row.createCell(cellIndex++).apply {
            setCellValue(priceChangePercent)
            if (priceChangePercent > 0) {
                cellStyle = upStyle
            } else if (priceChangePercent < 0) {
                cellStyle = downStyle
            }
        }
        // HighestValueIndicator(highPrice, 10)
        // val lowest10Days = LowestValueIndicator(closePrice, 10).getValue(index)
        // val highest10Days = HighestValueIndicator(closePrice, 10).getValue(index)
        row.createCell(cellIndex++).setCellValue(
            (closePrice.getValue(index) - closePrice.getValue(index - 10)).dividedBy(
                closePrice.getValue(index - 10)
            ).toString()
        )
        row.createCell(cellIndex++).setCellValue(closePriceRatio.getValue(index).toString())
        row.createCell(cellIndex++).setCellValue(isReversalLikely.getValue(index))
        row.createCell(cellIndex++).apply {
            setCellValue(priceSpread.getValue(index).doubleValue() / avgPriceSpread.getValue(index).doubleValue())
        }
        row.createCell(cellIndex++)
            .setCellValue(
                volume.getValue(index).doubleValue() / volumeSma.getValue(index).doubleValue()
            )
        row.createCell(cellIndex++).apply {
            setCellValue(signal)
            if (signal.lowercase().contains("strength")) {
                cellStyle =
                    if (signal.lowercase().contains("confirm")) {
                        goodStyle
                    } else if (signal.lowercase().contains("testing")) {
                        normalStyle
                    } else {
                        upStyle
                    }
            } else if (signal.lowercase().contains("weakness")) {
                cellStyle =
                    if (signal.lowercase().contains("confirm")) {
                        oopsStyle
                    } else {
                        downStyle
                    }
            }
        }
        row.createCell(cellIndex++).apply {
            val value = shortTermTrendSlope.getValue(index).doubleValue()
            setCellValue(value)
            if (value > 0) {
                cellStyle = upStyle
            } else if (value < 0) {
                cellStyle = downStyle
            }
        }
        row.createCell(cellIndex++).apply {
            val value = middleTermTrendSlope.getValue(index).doubleValue()
            setCellValue(value)
            if (value > 0) {
                cellStyle = upStyle
            } else if (value < 0) {
                cellStyle = downStyle
            }
        }
        row.createCell(cellIndex++).apply {
            val value = longTermTrendSlope.getValue(index).doubleValue()
            setCellValue(value)
            if (value > 0) {
                cellStyle = upStyle
            } else if (value < 0) {
                cellStyle = downStyle
            }
        }
        row.createCell(cellIndex++).setCellValue(rsi.getValue(index).intValue().toString())
        row.createCell(cellIndex++).apply {
            val value = macd.getValue(index).doubleValue()
            setCellValue(value)
            cellStyle =
                if (value > 0) {
                    upStyle
                } else {
                    downStyle
                }
        }
        row.createCell(cellIndex).apply {
            val value = macdSignalValue.getValue(index)
            setCellValue(macdDiff.getValue(index).doubleValue())
            cellStyle =
                if (value) {
                    upStyle
                } else {
                    downStyle
                }
        }
    }
}
