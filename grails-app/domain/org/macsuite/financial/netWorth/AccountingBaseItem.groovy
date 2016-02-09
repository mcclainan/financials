package org.macsuite.financial.netWorth

import org.macsuite.financial.banking.Account
import org.macsuite.financial.category.Category

class AccountingBaseItem implements Serializable{
    String     name
    String     description
    String     type
    BigDecimal limitAmount
    String     classification
    BigDecimal balance
    Account    account
    Category   purchase
    Category   sale
    Category   payment
    Category   proceeds
    Boolean    active = true

    static String ASSET = "Asset"
    static String LIABILITY = "Liability"
    static List<String> TYPE_LIST = [ASSET,LIABILITY]

    static String CREDIT_CARD ='Credit Card'
    static String LOAN = 'Loan'
    static String INVESTMENT = 'Investment'
    static String GENERAL = 'General'
    static String CREDIT_LINE = 'Credit Line'
    static List<String> CLASSIFICATION_LIST=[GENERAL,LOAN,CREDIT_CARD,INVESTMENT,CREDIT_LINE]

    static hasMany = [valueChangedEvents:ValueChangeEvent]

    static constraints = {
        name nullable:false,blank:false, unique: true
        description nullable:true,blank:true
        type nullable:false,blank:false,inList: TYPE_LIST
        classification  nullable:false,blank:false,inList: CLASSIFICATION_LIST
        balance nullable:false,blank:false
        limitAmount nullable:true, blank:true
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