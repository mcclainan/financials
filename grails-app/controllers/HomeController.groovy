

import grails.plugin.springsecurity.annotation.Secured
import org.macsuite.financial.CashFlowCalendarService
import org.macsuite.financial.beans.CashFlowCalendarBean
import org.macsuite.financial.tracking.Transaction

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class HomeController {
    CashFlowCalendarService cashFlowCalendarService
    def index() {
        def calendar = cashFlowCalendarService.calendar(null)
        Date date = calendar.date
        def beanList = calendar.beanList
        [mostRecentTransactions:Transaction.findAllByAutoDisplay(true,[max:10]),beanList:beanList,calendarDate:date]
    }

    def displayCalendar(){
        Integer month = params.month.toInteger()
        Integer year = params.year.toInteger()
        Calendar calendar = new GregorianCalendar(year,month,1)
        if(params.switch=='prev'){
            calendar.add(Calendar.MONTH,-1)
        }else{
            calendar.add(Calendar.MONTH,1)
        }

        def cal = cashFlowCalendarService.calendar(calendar.time)
        List<CashFlowCalendarBean> beanList = cal.beanList
        Date date = cal.date

        render template: 'templates/calendar', model: [beanList:beanList,calendarDate:date]
    }
}
