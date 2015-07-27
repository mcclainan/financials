package org.macsuite.financial.tracking

import org.macsuite.financial.banking.Account
import org.macsuite.financial.banking.BankRecord
import org.macsuite.financial.category.Category
import org.macsuite.financial.category.SpecialCategoryLabel

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
        date column: 'transaction_date'
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

        recon { Date startDate, Date endDate, Long accountId, List<Long> excluded ->
            not{'in'('id',excluded)}
            between('date',startDate,endDate)
            or{
                comboGroup{
                    ne('type','combo')
                }

                category{
                    eq('id',SpecialCategoryLabel.findByLabel('transferIn').category.id)
                }
            }
            isNull('bankRecord')
            account{
                eq('id',accountId)
            }
        }

        reconForRecord { Date date,BigDecimal amount, Long accountId, List<Long> excluded ->
            not{'in'('id',excluded)}
            between('date',date-3,date+3)
            BigDecimal giveAmount = amount.multiply(new BigDecimal('0.10'))
            between('amount',amount.subtract(giveAmount),amount.add(giveAmount))
            or{
                comboGroup{
                    ne('type','combo')
                }

                category{
                    eq('id',SpecialCategoryLabel.findByLabel('transferIn').category.id)
                }
            }
            isNull('bankRecord')

            account{
                eq('id',accountId)
            }
        }

        todayIncome{
            eq('date',new Date().clearTime())
            category{
                eq('type','I')
                eq('cash',true)
            }
            projections {
                sum('amount')
            }
        }

        todayExpense{
            eq('date',new Date().clearTime())
            category{
                eq('type','E')
                eq('cash',true)
            }
            projections {
                sum('amount')
            }
        }
    }
}
