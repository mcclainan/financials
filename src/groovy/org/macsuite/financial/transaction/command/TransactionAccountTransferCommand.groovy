package org.macsuite.financial.transaction.command

import grails.validation.Validateable
import org.macsuite.financial.banking.Account

/**
 * Created by tony on 6/23/15.
 */
@Validateable
class TransactionAccountTransferCommand {
    Date date
    Account fromAccount
    Account toAccount
    BigDecimal amount
    BigDecimal fee
    String location

    static constraints = {
        fee nullable: true
    }
}
