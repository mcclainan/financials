package org.macsuite.financial.netWorth

import org.macsuite.financial.banking.Account
import org.macsuite.financial.category.Category

class AccountingBaseItem implements Serializable{
    String     name
    String     description
    String     type
    BigDecimal balance
    Integer    useBehavior
    Account    account
    Category   purchase
    Category   sale
    Category   payment
    Category   proceeds
    Boolean    active = true

    static hasMany = [valueChangedEvents:ValueChangeEvent]

    static constraints = {
        name nullable:false,blank:false
        description nullable:true,blank:true
        type nullable:false,blank:false
        balance nullable:false,blank:false
        useBehavior nullable:true, blank:true
        account nullable:true,blank:true
        purchase nullable:true, blank:true
        sale nullable:true, blank:true
        payment nullable:true, blank:true
        proceeds nullable:true, blank:true
        active nullable:true, blank:true
    }

    static mapping = {
        sort(active:'desc', name:'asc')
    }

    String toString(){
        name
    }
}