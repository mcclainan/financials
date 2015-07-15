package org.macsuite.financial.tracking

import org.macsuite.financial.banking.Account

class TransactionComboGroup implements Serializable{
    String type
    Date   date
    String location
    Account account
    BigDecimal total
    Boolean validated = false

    static hasMany = [transactions:Transaction]
    static constraints = {
        type blank: false, inList: ['combo','transfer','special']
    }

    static mapping = {
        transactions cascade: "all-delete-orphan"
    }

    static namedQueries = {
        recon { Date startDate, Date endDate, Long accountId, List<Long> excluded ->
            not{'in'('id',excluded)}
            eq('type','combo')
            between('date',startDate,endDate)
            ne('validated',true)
            account{
                eq('id',accountId)
            }
        }

        reconForRecord { Date date,BigDecimal amount, Long accountId, List<Long> excluded ->
            not{'in'('id',excluded)}
            eq('type','combo')
            between('date',date-3,date+3)
            BigDecimal giveAmount = amount.multiply(new BigDecimal('0.10'))
            between('total',amount.subtract(giveAmount),amount.add(giveAmount))
            ne('validated',true)
            account{
                eq('id',accountId)
            }
        }
    }

}
