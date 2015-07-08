package org.macsuite.financial.tracking

import org.macsuite.financial.banking.Account

class TransactionComboGroup implements Serializable{
    String type
    Date   date
    String location
    Account account
    BigDecimal total

    static hasMany = [transactions:Transaction]
    static constraints = {
        type blank: false, inList: ['combo','transfer','special']
    }

    static mapping = {
        transactions cascade: "all-delete-orphan"
    }

}
