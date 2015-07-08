package org.macsuite.financial.beans

/**
 * Created by tony on 7/2/15.
 */
class CashFlowCalendarBean {
    Date date
    Integer dayOfWeek
    Integer day
    BigDecimal income
    BigDecimal expense
    BigDecimal remainder

    String toString(){
        "date:${date} day ${day} dayOfWeek ${dayOfWeek} income:${income}, expense:${expense}, remainder:${remainder}"
    }
}
