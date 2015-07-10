package org.macsuite.financial.reporting

import org.macsuite.financial.category.Category

class BudgetItem {
    Integer year
    Integer month
    BigDecimal amount
    Category category

    static constraints = {
        category unique: ['year','month']
    }

    static mapping = {
        sort([year:'desc',month:'desc', category: 'asc'])
    }

    static namedQueries = {
        budgetSet{Integer year,Integer month,String type->
            eq('month',month)
            eq('year',year)
            category{
                eq('type',type)
            }
        }

        cumulativeBudgetSet{Integer year,Integer month->
            eq('month',month)
            eq('year',year)
            category{
                eq('cumulative',true)
            }
        }
    }

    String toString(){
        "Year:${year} Month:${month} Category:${category} Amount:${amount}"
    }
}
