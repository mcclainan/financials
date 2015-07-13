package org.macsuite.financial.planning

import grails.plugin.springsecurity.annotation.Secured
import org.macsuite.financial.MacDateService
import org.macsuite.financial.beans.StartAndEndDate
import org.macsuite.financial.category.Category

@Secured('ROLE_FINANCIAL_PLANNER')
class PlannedTransactionController {
    MacDateService macDateService
    CreatePlannedTransactionService createPlannedTransactionService
    def index() {
        Date date = new Date()
        Integer year = params.year?.toInteger()?:date.getAt(Calendar.YEAR)
        Integer month = params.month?.toInteger()
        //Java style null check allows for a 0 month
        if(params.month == null){
            month=date.getAt(Calendar.MONTH)
        }
        def incomeList =  PlannedTransaction.budget(year,month,'I')
        def expenseList = PlannedTransaction.budget(year,month,'E')

        [month:month,year:year.toString(),incomeList:incomeList,expenseList:expenseList,
         previousMonth:macDateService.getPreviousMonth(month,year),nextMonth:macDateService.getNextMonth(month,year)]
    }

    def create(){
        StartAndEndDate startAndEndDate = macDateService.getStartAndEnd(params.month.toInteger(),params.year.toInteger(),1)
        render template: "templates/create", model: [startDate:startAndEndDate.startDate,endDate:startAndEndDate.endDate]
    }

    def save(CreatePlannedTransactionCommand command){
        if(command.hasErrors()){
            render template: "templates/create", model: [command:command]
            return
        }
        String result = createPlannedTransactionService.create(command)

        render template: 'templates/status', model: [status:'success',statusMessage:result]
    }

    def show(){
        Category category = Category.findByName(params.id)
        Integer month = params.month.toInteger()
        Integer year = params.year.toInteger()
        params.max =10
        StartAndEndDate startAndEndDate = macDateService.getStartAndEnd(month,year)
        render template: 'templates/show',
                model: [plannedTransactionList:PlannedTransaction.listByCategoryAndDate(category.id,startAndEndDate.startDate,startAndEndDate.endDate).list(params),
                        plannedTransactionCount:PlannedTransaction.listByCategoryAndDate(category.id,startAndEndDate.startDate,startAndEndDate.endDate).count(),
                        category:category.name,month:month,year:year]
    }

    def edit(){
        PlannedTransaction pt = PlannedTransaction.get(params.id)
        render template: "templates/edit", model: [command:pt]
    }

    def update(PlannedTransactionCommand command){
        println "Ping"
        if(command.hasErrors()){
            render template: "templates/edit", model: [command:command]
            return
        }

        command.bind(PlannedTransaction.get(command.id)).save(flush: true)
        render template: "templates/status", model: [status:'success', statusMessage:message(code: "plannedTransactionCont.update.success.message")]
    }

    def delete(){
        PlannedTransaction pt = PlannedTransaction.get(params.id)
        pt.delete(flush: true)
        flash.notif = [
                status: 'info',
                content: message(code: 'myDefault.deleted.message', args:'Planned Transaction')
        ]
        redirect action:'index'
    }

    def multiDelete(){
        Category category = Category.get(params.id)
        Integer month = params.month.toInteger()
        Integer year = params.year.toInteger()
        StartAndEndDate dates = macDateService.getStartAndEnd(month,year)
        DeletePlannedTransactionCommand command = new DeletePlannedTransactionCommand(category: category,startDate: dates.startDate,endDate: dates.endDate)
        render template: 'templates/delete', model:[command:command]
    }

    def executeMultiDelete(DeletePlannedTransactionCommand command){
        String result=createPlannedTransactionService.deleteMultiplePlannedTransactions(command)
        flash.notif = [
                status: 'info',
                content: result
        ]
        redirect action: 'index'
    }
}
