package org.macsuite.financial.banking

import org.macsuite.financial.netWorth.AccountingBaseItem
import org.macsuite.financial.tracking.Transaction

class Account implements Serializable{

    String title
    BigDecimal balance
    Boolean liquid = true
    Boolean active = true

    static belongsTo = [importFormat:ImportFormat,type:AccountType]

    static hasOne = [accountingBaseItem:AccountingBaseItem]

    static hasMany = [transactions:Transaction, bankRecords:BankRecord]

    static constraints = {
        title blank: false
        balance nullable: true
        liquid nullable: false
        active nullable: false
        accountingBaseItem nullable: true
    }

    BigDecimal getBalance(){
        accountingBaseItem?.balance?:balance
    }

    void setBalance(BigDecimal balance){
        if(accountingBaseItem){
            accountingBaseItem.balance=balance
        }else{
            this.balance = balance
        }
    }

    def beforeInsert(){
        accountingBaseItem?.save()
    }

    String toString(){
        title
    }

    static namedQueries = {
        cashTotal{
            type{
                eq('resourceType','cash')
            }
            projections{
                sum('balance')
            }
        }
        cashAccounts{
            type{
                eq('resourceType','cash')
            }
        }
        creditTotal{
            type{
                eq('resourceType','credit')
            }
            projections{
                sum('balance')
            }
        }
        creditAccounts{
            type{
                eq('resourceType','credit')
            }
        }
        benefitsTotal{
            type{
                eq('resourceType','benefits')
            }
            projections{
                sum('balance')
            }
        }
        benefitsAccounts{
            type{
                eq('resourceType','benefits')
            }
        }
    }
}