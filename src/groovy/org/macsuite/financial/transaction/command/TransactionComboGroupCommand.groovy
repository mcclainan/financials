package org.macsuite.financial.transaction.command

import grails.validation.Validateable
import org.macsuite.financial.banking.Account
import org.macsuite.financial.tracking.TransactionComboGroup

/**
 * Created by tony on 6/18/15.
 */
@Validateable
class TransactionComboGroupCommand {
    Date date
    String type = 'combo'
    String location
    Account account
    BigDecimal total
    Boolean cashBack = false

    static constraints = {
        date nullable: false
        type nullable: false, inList: ['combo','transfer','paycheck','cashBack']
        total nullable: false
    }

    TransactionComboGroup spawn(){
        return new TransactionComboGroup(date: date, type: type, total: total.setScale(2,BigDecimal.ROUND_HALF_DOWN),location: location,account: account)
    }
}
