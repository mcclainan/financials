package org.macsuite.financial

import grails.transaction.Transactional
import org.macsuite.financial.beans.StartAndEndDate

@Transactional
class MacDateService {

    /**
     * Get the start and end date of a particular month
     * @param month
     * @param year
     * @return org.macsuite.financial.beans.StartAndEndDate
     */
    def getStartAndEnd(Integer month,Integer year) {
        Calendar calendar = new GregorianCalendar(year,month,1)
        Date startDate = calendar.getTime()
        calendar.set(Calendar.DAY_OF_MONTH,calendar.getActualMaximum(Calendar.DAY_OF_MONTH))
        Date endDate = calendar.getTime()
        return new StartAndEndDate(startDate: startDate, endDate:endDate)
    }

    /**
     * Gets the start and end date with a specific duration after the current date.
     * @param month
     * @param year
     * @param duration
     * @return org.macsuite.financial.beans.StartAndEndDate
     * @throws IllegalArgumentException
     */
    def getStartAndEnd(Integer month,Integer year,Integer duration)throws IllegalArgumentException {
        if(!duration){
            duration=1
        }
        Integer day = 1
        Calendar calendar = new GregorianCalendar(year,month,day)
        Date startDate = calendar.getTime()
        Date compareDate = new Date()
        if(startDate.clearTime()<compareDate){
            if(startDate.getAt(Calendar.MONTH)<compareDate.getAt(Calendar.MONTH) &&
               startDate.getAt(Calendar.YEAR)<=compareDate.getAt(Calendar.YEAR)){
                throw new IllegalArgumentException('')
            }
            startDate = compareDate
            day = startDate.getAt(Calendar.DAY_OF_MONTH)
        }
        calendar.set(Calendar.DAY_OF_MONTH,day+duration)
        Date endDate = calendar.getTime()
        return new StartAndEndDate(startDate: startDate, endDate:endDate)
    }

    /**
     * Get the start and end date starting at a particular day for a specific duration.
     * @param month
     * @param year
     * @param duration
     * @param day
     * @return org.macsuite.financial.beans.StartAndEndDate
     */
    def getStartAndEnd(Integer month,Integer year,Integer duration, Integer day) {
        if(!day){
            day = 1
        }
        if(!duration){
            duration=1
        }
        Calendar calendar = new GregorianCalendar(year,month,day)
        Date startDate = calendar.getTime()
        calendar.set(Calendar.DAY_OF_MONTH,day+duration)
        Date endDate = calendar.getTime()
        return new StartAndEndDate(startDate: startDate, endDate:endDate)
    }

    def getPreviousMonth(Integer month, Integer year){
        month = month-1
        if(month<0){
            month=11
            year = year-1
        }
        return [month:month,year:year]
    }

    def getNextMonth(Integer month, Integer year){
        month = month+1
        if(month>11){
            month=0
            year = year+1
        }
        return [month:month,year:year]
    }


}
