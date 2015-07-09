package org.macsuite.financial.planning

import org.macsuite.financial.category.Category

class PlannedTransaction implements Serializable{
    Date       date
    BigDecimal amount
    Boolean    rolling = false

    static belongsTo = [category:Category]


    static constraints = {
        date blank:false
        amount blank:false
        rolling blank:false
    }

    static budget(Integer year, Integer month,String type){
        StringBuffer query = new StringBuffer()
        Date date = new Date()
        Calendar calendar = new GregorianCalendar(year?:date.getAt(Calendar.YEAR),month?:date.getAt(Calendar.MONTH),1)
        Date startDate = calendar.getTime()
        calendar.set(Calendar.DAY_OF_MONTH,calendar.getActualMaximum(Calendar.DAY_OF_MONTH))
        Date endDate = calendar.getTime()
        query.append("select c.mainCategory, p.category,sum(p.amount)")
        query.append("from PlannedTransaction p, Category c ")
        query.append("where c.type = :type ")
        query.append("and p.category = c.id ")
        query.append("and p.date between :startDate and :endDate ")
        query.append("group by c.mainCategory,p.category ")
        query.append("order by c.mainCategory,p.category ")
        return executeQuery(query.toString(),[type:type,startDate:startDate,endDate:endDate])
    }


    static namedQueries = {
        transactionTotal{type,cash,startDate,endDate->
            category{
                eq('type',type)
                eq('cash',true)
            }
            between('date',startDate,endDate)
            projections{
                sum('amount')
            }
        }
    }

    static mapping = {
        sort('date')
    }

    String toString(){
        "${category} on ${date.format('MM/dd/yyyy')}"
    }
}
