package com.chaomao.modules.analyze

import org.ta4j.core.Indicator
import org.ta4j.core.indicators.CachedIndicator

class PreviousBooleanIndicator(private val indicator: Indicator<Boolean>) :
    CachedIndicator<Boolean>(indicator) {
    override fun calculate(index: Int): Boolean {
        if (index < 1) return false
        return indicator.getValue(index - 1)
    }
}
