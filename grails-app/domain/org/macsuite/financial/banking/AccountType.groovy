package org.macsuite.financial.banking

class AccountType implements Serializable{
    String  type
    String  resourceType
    Boolean active = true
    static hasMany = [accounts:Account]
    static constraints = {
        resourceType blank: false, inList: ['cash','credit','benefits','investment','other']
    }
    public String toString(){
        type
    }
}
