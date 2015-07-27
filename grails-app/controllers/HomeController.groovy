

import grails.plugin.springsecurity.annotation.Secured
import org.macsuite.financial.CashFlowCalendarService
import org.macsuite.financial.beans.CashFlowCalendarBean
import org.macsuite.financial.planning.PlannedTransaction
import org.macsuite.financial.planning.PlannedTransactionService
import org.macsuite.financial.reporting.StaticBudgetService
import org.macsuite.financial.tracking.Transaction

@Secured(['IS_AUTHENTICATED_FULLY'])
class HomeController {
    CashFlowCalendarService cashFlowCalendarService
    StaticBudgetService staticBudgetService
    PlannedTransactionService plannedTransactionService

    def index() {
        def calendar = cashFlowCalendarService.calendar(null)
        plannedTransactionService.roll()
        Date date = calendar.date
        def beanList = calendar.beanList
        [mostRecentTransactions:Transaction.findAllByAutoDisplay(true,[max:10]),
         beanList:beanList,calendarDate:date,
         budgetCompareList:staticBudgetService.createCompareObjects(date.getAt(Calendar.YEAR),date.getAt(Calendar.MONTH))]
    }

    def displayCalendar(){
        Integer month = params.month.toInteger()
        Integer year = params.year.toInteger()
        Calendar calendar = new GregorianCalendar(year,month,1)
        if(params.switch=='prev'){
            calendar.add(Calendar.MONTH,-1)
        }else if(params.switch=='next'){
            calendar.add(Calendar.MONTH,1)
        }

        def cal = cashFlowCalendarService.calendar(calendar.time)
        List<CashFlowCalendarBean> beanList = cal.beanList
        Date date = cal.date

        render template: 'templates/calendar', model: [beanList:beanList,calendarDate:date]
    }

    def removeRolling(){
        def pt = PlannedTransaction.get(params.id)
        println "hello"
        pt.rolling=false
        pt.rolled=false
        pt.save(flush: true)
        render template: 'templates/missedList'
    }


}
