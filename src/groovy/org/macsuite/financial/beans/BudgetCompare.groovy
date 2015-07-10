package org.macsuite.financial.beans

import org.macsuite.financial.category.Category

/**
 * Created by tony on 7/9/15.
 */
class BudgetCompare {
    Category category
    BigDecimal budgeted
    BigDecimal spent

    BigDecimal getUsed(){
        BigDecimal allowed = new BigDecimal('100')
        BigDecimal used = spent.divide(budgeted,2,BigDecimal.ROUND_HALF_UP).multiply(allowed)
        return used.compareTo(allowed)<0?used:allowed
    }

    BigDecimal getLeft(){
        BigDecimal allowed = new BigDecimal('100')
        BigDecimal used = spent.divide(budgeted,2,BigDecimal.ROUND_HALF_UP).multiply(allowed)
        return used.compareTo(allowed)<0?allowed.minus(used):0
    }

    String toString(){
        "Category:${category}  budgeted:${budgeted}  spent:${spent} used:${used.setScale(0)} left:${left.setScale(0)}"
    }
}
