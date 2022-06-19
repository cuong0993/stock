package com.chaomao.modules.analyze

import org.ta4j.core.Indicator
import org.ta4j.core.indicators.CachedIndicator

class NotLogicIndicator(private val indicator: Indicator<Boolean>) :
    CachedIndicator<Boolean>(indicator) {
    override fun calculate(index: Int): Boolean {
        return !indicator.getValue(index)
    }
}
