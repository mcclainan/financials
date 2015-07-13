package org.macsuite.financial.banking

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.macsuite.financial.MacDateService
import org.macsuite.financial.beans.BankRecordImportReport
import org.macsuite.financial.beans.StartAndEndDate
import org.macsuite.financial.exception.AppException

@Secured(['ROLE_FINANCIAL_PLANNER','ROLE_ADMIN'])
class BankRecordController {
    BankRecordService bankRecordService
    MacDateService macDateService

    def index(){
        Integer year = params.year?.toInteger()?:new Date().getAt(Calendar.YEAR)
        Integer month = params.month?.toInteger()?:new Date().getAt(Calendar.MONTH)
        StartAndEndDate startAndEndDate = macDateService.getStartAndEnd(month,year)
        params.max=10
        [bankRecordsList: BankRecord.findAllByDateBetween(startAndEndDate.startDate,startAndEndDate.endDate,params),
         bankRecordCount:BankRecord.countByDateBetween(startAndEndDate.startDate,startAndEndDate.endDate),
         year:year,month:month,lastUpdated:BankRecord.lastUpload.get()]
    }

    def show(){
        params.max=10
        [bankRecordsList:BankRecord.findAllByBatch(params.id,params),
         bankRecordCount:BankRecord.countByBatch(params.id)]
    }

    def serializeDuplicate(){
        bankRecordService.serializeDuplicate(params)
        flash.notif=[
                status: 'success',
                content: "Bank Record has been successfully serialized and saved. There are still ${session.duplicateRecords}"
        ]
        redirect action: 'show', id: params.batch
    }

    def deleteBatch(){
        bankRecordService.deleteBatch(params.id)
        flash.notif = [
                status: 'info',
                content: "Deleted all unassociated bank record in batch #${params.id}"
        ]
        redirect action: 'index'
    }

    @Transactional
    def upload(){

        Account account = Account.get(params.id)

        if(!account) {
            flash.notif = [
                    status : 'danger',
                    content: "No Account with id ${params.id} could be found."
            ]
            redirect(action: 'index')
        }

        BankRecordImportReport report
        try{
            report = bankRecordService.upload(request.getFile("file"),account)
        }
        catch (AppException ae){
            flash.notif = [
                    status: ae.status,
                    content: ae.message
            ]
            redirect action: 'index'
            return
        }

        session.duplicateRecords = report.duplicates
        flash.message = "${report.numberImported} Bank Records where added. The file contained ${report.duplicates.size()} duplicate records."
        redirect action: 'show', id:report.batchNumber
    }
}
