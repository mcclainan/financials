package org.macsuite.financial.planning

import grails.validation.Validateable
import org.macsuite.financial.category.Category

/**
 * Created by tony on 6/30/15.
 */
@Validateable
class PlannedTransactionCommand {
    Long       id
    Date       date
    BigDecimal amount
    Boolean    rolling = false
    Category   category

    static constraints = {
        date blank:false
        amount blank:false
        rolling blank:false
    }

    PlannedTransaction bind(PlannedTransaction pt){
        pt.date=date
        pt.amount=amount
        pt.rolling=rolling
        pt.category=category
        return pt
    }
}
