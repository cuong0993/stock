package com.chaomao.modules.analyze

import org.ta4j.core.BarSeries
import org.ta4j.core.indicators.CachedIndicator
import org.ta4j.core.num.Num

class ClosePriceRatioIndicator(private val series: BarSeries) : CachedIndicator<Num>(series) {
    override fun calculate(index: Int): Num {
        val close = series.getBar(index).closePrice
        val high = series.getBar(index).highPrice
        val low = series.getBar(index).lowPrice
        val spread = high - low
        val diff = close - low
        return diff.dividedBy(spread)
    }
}
