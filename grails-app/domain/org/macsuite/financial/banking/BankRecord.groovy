package org.macsuite.financial.banking

import org.macsuite.financial.tracking.Transaction

class BankRecord implements Serializable{
    Date       date
    Date       dateCreated
    String     description
    BigDecimal amount
    String    batch

    static belongsTo = [account:Account]

    static hasMany = [transactions:Transaction]

    static constraints = {
        date nullable:false, blank:false
        dateCreated nullable:true, blank:true
        description nullable:false, blank:false, unique: ['account','date','amount']
        amount nullable:false, blank:false
        account nullable:false, blank:false
        batch nullable:false, blank:false
    }

    static mapping = {
        sort([date: 'desc'])
    }

    static namedQueries = {
        lastUpload{
            projections {
                max('dateCreated')
            }
        }

        recon{Date startDate,Date endDate,Long accountId->
            between('date',startDate,endDate)
            isEmpty('transactions')
            account{
                eq('id',accountId)
            }
            order('date')
        }
    }

    String toString(){
        "Batch:${batch}, date:${date}, amount:${amount}, description:${description}"
    }
}
