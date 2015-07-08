package org.macsuite.financial.planning

import grails.transaction.Transactional

import java.text.DecimalFormat

@Transactional
class CreatePlannedTransactionService {
    private DecimalFormat formatter = new DecimalFormat("\$#,###.00")
    def create(CreatePlannedTransactionCommand command) {
        if(command.mode == CreatePlannedTransactionCommand.SINGLE){
            new PlannedTransaction(category: command.category,date: command.startDate, amount: command.amount,rolling: command.category.required).save(flush: true)
            Double amount = command.amount.doubleValue()
            return "Created a single ${command.category} planned transaction<br/> for ${command.startDate.format('MMMM dd yyyy')} in the amount of ${formatter.format(amount)}."
        }
        else{
            if(command.replaceCurrent){
                deleteOldPlannedTransactions(command)
            }
            List<Date> dateList = getDateList(command)
            BigDecimal amount = getAmount(command.amount,command.amountMode, dateList.size())
            BigDecimal total = new BigDecimal('0')
            dateList.each {date->
                new PlannedTransaction(category: command.category,date: date, amount: amount,rolling: command.category.required).save(flush: true)
                total = total.add(amount)
            }
            return getSuccessMessage(dateList,total.doubleValue(),amount.doubleValue(),command)
        }
    }

    def deleteOldPlannedTransactions(CreatePlannedTransactionCommand command){
        PlannedTransaction.listByCategoryAndDate(command.category.id,command.startDate.clearTime(),command.endDate.clearTime()+1).list().each {pt->
            pt.delete(flush: true)
        }
    }

    def deleteMultiplePlannedTransactions(DeletePlannedTransactionCommand command){
        Integer cnt=0
        BigDecimal amount = new BigDecimal('0')
        PlannedTransaction.listByCategoryAndDate(command.category.id,command.startDate.clearTime(),command.endDate.clearTime()+1).list().each {pt->
            amount = amount.add(pt.amount)
            cnt=cnt+1
            pt.delete(flush: true)
        }
        return "Successfully deleted ${cnt} planned transactions for ${command.category} totaling ${formatter.format(amount.doubleValue())}"
    }



    private List<Date> getDateList(CreatePlannedTransactionCommand command){
        Date startDate = command.startDate
        List<Date> dateList = []

        while (startDate<=command.endDate){
            dateList<<startDate
            startDate = getNextDate(startDate,command.frequency,command.customFrequencyType,command.customFrequency)
        }
        return dateList
    }

    private Date getNextDate(Date date,String frequency, String type, Integer skip){
        Calendar calendar = new GregorianCalendar(date.getAt(Calendar.YEAR),date.getAt(Calendar.MONTH),date.getAt(Calendar.DAY_OF_MONTH))
        switch (frequency){
            case CreatePlannedTransactionCommand.DAILY:
                calendar.add(Calendar.DAY_OF_MONTH,1)
                break
            case CreatePlannedTransactionCommand.WEEKLY:
                calendar.add(Calendar.DAY_OF_MONTH,7)
                break
            case CreatePlannedTransactionCommand.MONTHLY:
                calendar.add(Calendar.MONTH,1)
                break
            case CreatePlannedTransactionCommand.CUSTOM:
                calendar = getNextCustomDate(calendar,type,skip)
                break
        }
        return calendar.getTime()
    }

    private Calendar getNextCustomDate(Calendar calendar, String type, Integer skip){
        switch (type){
            case CreatePlannedTransactionCommand.DAY:
                calendar.add(Calendar.DAY_OF_MONTH,skip)
                break
            case CreatePlannedTransactionCommand.WEEK:
                calendar.add(Calendar.DAY_OF_MONTH,(7*skip))
                break
            case CreatePlannedTransactionCommand.MONTH:
                calendar.add(Calendar.MONTH,skip)
                break
        }
        return calendar
    }

    private String getSuccessMessage(List dateList, Double total, Double amount, CreatePlannedTransactionCommand command){
        StringBuffer message = new StringBuffer()
        message.append("Created ${dateList.size()} planned transactions ")
        message.append("for ${command.category}<br/> to occur ")
        if(command.frequency==CreatePlannedTransactionCommand.CUSTOM){
            message.append("every ${command.customFrequency} ${command.customFrequencyType}s, ")
        }else{
            message.append("${command.frequency}, ")
        }
        message.append("<br/>starting on ${dateList[0].format('MM/dd/yyyy')} and ending on ${dateList[dateList.size()-1].format('MM/dd/yyyy')}, ")
        message.append("<br/>in the amount of ${formatter.format(amount)} each totalling ${formatter.format(total)}")
        return message.toString()
    }

    private BigDecimal getAmount(BigDecimal amount, String amountMode, Integer divider){
        println amount

        amount.setScale(2,BigDecimal.ROUND_HALF_UP)
        BigDecimal dividerBD = new BigDecimal(divider.toString())
        dividerBD.setScale(2,BigDecimal.ROUND_HALF_UP)
        if(amountMode == CreatePlannedTransactionCommand.SPREAD){
            amount = amount.divide(dividerBD,2,BigDecimal.ROUND_HALF_UP)
        }
        return amount
    }

}
