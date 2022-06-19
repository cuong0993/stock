package com.chaomao.modules.analyze

import org.ta4j.core.BarSeries
import org.ta4j.core.indicators.CachedIndicator

class TwoDaysLowVolIndicator(private val series: BarSeries) : CachedIndicator<Boolean>(series) {
    override fun calculate(index: Int): Boolean {
        if (index < 2) return false
        val vol = series.getBar(index).volume
        val vol1 = series.getBar(index - 1).volume
        val vol2 = series.getBar(index - 2).volume
        return vol < vol1 && vol < vol2
    }
}
