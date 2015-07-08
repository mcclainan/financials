package org.macsuite.financial.banking

class ImportFormat implements Serializable{
    String  name
    String  dateFormat='MM/dd/yyyy'
    Integer dateColumn
    Integer descriptionColumn
    Integer amountColumn
    Integer debitColumn
    Integer creditColumn
    Boolean active = true
    Boolean hasMultipleAmountColumns = false
    Boolean hasHeading = false

    static hasMany = [accounts:Account]

    static constraints = {
        name nullable:false,blank:false
        dateColumn nullable:false,blank:false
        descriptionColumn nullable:false,blank:false
        amountColumn nullable:true,blank:true
        debitColumn nullable:true,blank:true
        creditColumn nullable:true,blank:true
        active blank:true
        hasMultipleAmountColumns blank:true
        hasHeading blank:true
    }

    String toString(){
        name
    }
}
