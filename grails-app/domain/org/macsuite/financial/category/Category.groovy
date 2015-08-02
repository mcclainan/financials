package org.macsuite.financial.category

import org.macsuite.financial.planning.PlannedTransaction
import org.macsuite.financial.tracking.Transaction

class Category{
    String name
    String description
    Boolean cash
    String type
    Boolean active = true
    Boolean displayOnMobile = true
    Boolean cumulative = false
    Boolean required = false

    static final String INCOME = 'I'
    static final String EXPENSE = 'E'
    static final List<String> TYPES = [INCOME,EXPENSE]

    static belongsTo = [mainCategory:MainCategory]

    static hasMany = [transactions:Transaction, plannedTransactions:PlannedTransaction]

    static constraints = {
        name blank: false, unique: ['mainCategory']
        description nullable: true, blank: true
        active blank:false
        displayOnMobile blank:false
        type(nullable: false, blank: false, size:1..1, inList:TYPES)
        cumulative nullable:true, blank:true
        cash(nullable: false, blank: false)
    }

    public String toString(){
        name
    }
     static mapping = {
         sort(active: 'desc', name:'asc')
     }
}
