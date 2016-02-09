package org.macsuite.financial.reporting

import grails.transaction.Transactional
import org.macsuite.financial.MacDateService
import org.macsuite.financial.beans.BudgetCompare
import org.macsuite.financial.beans.StartAndEndDate
import org.macsuite.financial.category.Category
import org.macsuite.financial.planning.PlannedTransaction
import org.macsuite.financial.tracking.Transaction

@Transactional
class StaticBudgetService {
    MacDateService macDateService
    def setStaticBudget() {
        Date date = new Date()
        Integer year = date.getAt(Calendar.YEAR)
        Integer month = date.getAt(Calendar.MONTH)+1
        PlannedTransaction.budget(year,month,'I').each {
            new BudgetItem(year:year,month:month,category:Category.findByName(it[1].toString()),amount: new BigDecimal(it[2].toString())).save(flush:true,failOnError: true)
        }
        PlannedTransaction.budget(year,month,'E').each {
            new BudgetItem(year:year,month:month,category:Category.findByName(it[1].toString()),amount: new BigDecimal(it[2].toString())).save(flush:true,failOnError: true)
        }
    }

    List<BudgetCompare> createCompareObjects(Integer year, Integer month){
        List<BudgetCompare> budgetCompareList=[]
        StartAndEndDate startAndEndDate = macDateService.getStartAndEnd(month,year)
        BudgetItem.cumulativeBudgetSet(year,month+1).list().each { budgetItem->
            BigDecimal amount = Transaction.withCriteria {
                between('date',startAndEndDate.startDate,startAndEndDate.endDate+1)
                eq('category',budgetItem.category)
                projections {
                    sum('amount')
                }
            }.get(0)?:new BigDecimal('0')
            budgetCompareList<<new BudgetCompare(category: budgetItem.category, budgeted: budgetItem.amount, spent:amount)
        }
        return budgetCompareList
    }
}
