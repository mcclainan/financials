package org.macsuite.financial

import grails.transaction.Transactional
import org.macsuite.financial.banking.Account
import org.macsuite.financial.beans.CashFlowCalendarBean
import org.macsuite.financial.planning.PlannedTransaction
import org.macsuite.financial.tracking.Transaction

@Transactional
class CashFlowCalendarService {

    static calendar(Date startDate){
        StringBuffer query = new StringBuffer()
        Date date = new Date()
        if(!startDate || startDate<date){
            startDate = date
        }
        int decrimenter=0
        if(startDate==date){
            decrimenter=1
        }
        Calendar endCalendar=new GregorianCalendar(startDate.getAt(Calendar.YEAR),startDate.getAt(Calendar.MONTH),startDate.getAt(Calendar.DAY_OF_MONTH))
        endCalendar.set(Calendar.DAY_OF_MONTH,endCalendar.getActualMaximum(Calendar.DAY_OF_MONTH))
        query.append("select p.date, sum(p.amount) ")
        query.append("from PlannedTransaction p, Category c ")
        query.append("where p.date >= :date ")
        query.append("and p.category = c.id ")
        query.append("and c.type = 'I' ")
        query.append("and c.cash = :cash ")
        query.append("and p.date between :startDate and :endDate ")
        query.append("group by p.date ")
        query.append("order by p.date")
        def income = Account.executeQuery(query.toString(),[date:date-1,startDate: startDate-decrimenter, endDate: endCalendar.getTime(),cash:true])
        query = new StringBuffer()
        query.append("select p.date, sum(p.amount) ")
        query.append("from PlannedTransaction p, Category c ")
        query.append("where p.date >= :date ")
        query.append("and p.category = c.id ")
        query.append("and c.type = 'E' ")
        query.append("and c.cash = :cash ")
        query.append("and p.date between :startDate and :endDate ")
        query.append("group by p.date ")
        query.append("order by p.date")
        def expense =  Account.executeQuery(query.toString(),[date:date-1,startDate: startDate-decrimenter,endDate: endCalendar.getTime(),cash:true])
        List<CashFlowCalendarBean> cashFlowCalendarBeanList = []
        Calendar calendar = new GregorianCalendar(startDate.getAt(Calendar.YEAR),startDate.getAt(Calendar.MONTH),startDate.getAt(Calendar.DAY_OF_MONTH))
        BigDecimal total = Account.cashTotal.get()
        BigDecimal todayIncome = Transaction.todayIncome.get()
        if(todayIncome){
            total = total.subtract(todayIncome)
        }
        BigDecimal todayExpense = Transaction.todayExpense.get()
        if(todayExpense){
            total = total.add(todayExpense)
        }
        if(startDate!=date){
            BigDecimal amount = new BigDecimal(PlannedTransaction.transactionTotal('I',true,date-1,startDate-1).get().toString())
            total = total.add(amount)
            amount = new BigDecimal(PlannedTransaction.transactionTotal('E',true,date-1,startDate-1).get().toString())
            total = total.minus(amount)
        }
        if(income.size()>0 || expense.size()>0){
            for(int i=1;i<calendar.get(Calendar.DAY_OF_WEEK);i++){
                cashFlowCalendarBeanList<<new CashFlowCalendarBean()
            }
        }
        int breaker = 0
        while(income.size()>0 || expense.size()>0){
            Date currentDate = calendar.getTime()
            CashFlowCalendarBean cashFlowCalendarBean = new CashFlowCalendarBean()
            if(expense.size()>0 && expense[0][0]==currentDate){
                BigDecimal amount = new BigDecimal("${expense[0][1]}")
                cashFlowCalendarBean.expense = amount
                total = total.subtract(amount)
                expense.remove(0)
            }
            if(income.size()>0 && income[0][0]==currentDate){
                BigDecimal amount = new BigDecimal("${income[0][1]}")
                cashFlowCalendarBean.income = amount
                total = total.add(amount)
                income.remove(0)
            }
            cashFlowCalendarBean.date=startDate
            cashFlowCalendarBean.day = currentDate.getAt(Calendar.DAY_OF_MONTH)
            cashFlowCalendarBean.dayOfWeek = currentDate.getAt(Calendar.DAY_OF_WEEK)
            cashFlowCalendarBean.remainder = total
            cashFlowCalendarBeanList<<cashFlowCalendarBean
            calendar.add(Calendar.DAY_OF_MONTH,1)

        }
        return [date:startDate,beanList:cashFlowCalendarBeanList]
    }
}
