package com.chaomao

import org.ta4j.core.Indicator
import org.ta4j.core.indicators.CachedIndicator

class AndLogicIndicator(
    private val first: Indicator<Boolean>,
    private val second: Indicator<Boolean>
) : CachedIndicator<Boolean>(first) {
    override fun calculate(index: Int): Boolean {
        return first.getValue(index) && second.getValue(index)
    }
}