package org.macsuite.financial.tracking

import org.macsuite.financial.banking.Account
import org.macsuite.financial.banking.BankRecord
import org.macsuite.financial.category.Category

class Transaction implements Serializable{
    Date       date
    Date       dateCreated
    Date       lastUpdated
    String     location
    String     description
    BigDecimal amount
    Boolean    autoDisplay = true
    Boolean    temporary = false

    static transients = ['user']

    static belongsTo = [category:Category,account:Account]

    static hasOne = [comboGroup:TransactionComboGroup, bankRecord:BankRecord]

    static constraints = {
        date        blank:false
        dateCreated blank:true,nullable: true
        lastUpdated blank:true,nullable: true
        location    blank:false
        description nullable: true, blank:true
        amount blank:false
        autoDisplay nullable: true
        comboGroup nullable: true
        bankRecord nullable: true
        temporary nullable: false
    }

    public String toString(){
        amount.setScale(2,BigDecimal.ROUND_HALF_DOWN)
        "${amount} at ${location} on ${date.format('MM/dd/yyyy')}"
    }

    static mapping = {
        sort date: 'desc'
    }
    static namedQueries = {
        singleTransactions{
            isNull('comboGroup')
            ne('temporary',true)
        }
        temporaryTransactions{
            isNull('comboGroup')
            eq('temporary',true)
        }
        singleTransactionsWithCashBack{
            comboGroup{
                eq('type','cashBack')
            }
        }
        comboTransactions{
            comboGroup{
                eq('type','combo')
            }
            order('date','desc')
            order('comboGroup')
        }
        accountTransfers{
            comboGroup{
                eq('type','transfer')
            }
            order('date','desc')
            order('comboGroup')
        }
        paychecks{
            comboGroup{
                eq('type','paycheck')
            }
        }
    }
}
