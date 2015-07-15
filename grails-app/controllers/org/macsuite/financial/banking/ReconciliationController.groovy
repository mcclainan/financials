package org.macsuite.financial.banking

import grails.plugin.springsecurity.annotation.Secured
import org.macsuite.financial.beans.ReconBean
import org.macsuite.financial.tracking.TransactionService
import org.macsuite.financial.transaction.command.TransactionCommand

@Secured(['ROLE_ADMIN','ROLE_FINANCIAL_PLANNER'])
class ReconciliationController {

    ReconciliationService reconciliationService
    TransactionService transactionService

    def index() {
        session.excludedTrans = []
        session.excludedCombo = []
    }

    def recon(ReconCommand command){
        if(command.hasErrors()){
            render view: 'index',model: [command:command]
            return
        }
        List<Long> excludedTrans = session.excludedTrans
        List<Long> excludedCombo = session.excludedCombo

        List<BankRecord> bankRecords = reconciliationService.fetchBankRecords(command.date.getAt(Calendar.YEAR),
                                                                                command.date.getAt(Calendar.MONTH),
                                                                                command.account)
        List<ReconBean> reconBeans = reconciliationService.fetchReconItems(command.date.getAt(Calendar.YEAR),
                                                                            command.date.getAt(Calendar.MONTH),
                                                                            command.account, excludedTrans,excludedCombo)
        render view:'index',model:[bankRecords:bankRecords,reconBeans:reconBeans,command: command]
    }

    def refresh(){
        Integer month = params.month.toInteger()
        Integer year = params.year.toInteger()
        Calendar cal = new GregorianCalendar(year,month,1)
        Account account = Account.get(params.accountId.toLong())
        ReconCommand cmd = new ReconCommand(date: cal.time,account: account)

        List<Long> excludedTrans = session.excludedTrans
        List<Long> excludedCombo = session.excludedCombo

        List<BankRecord> bankRecords = reconciliationService.fetchBankRecords(year,month,account)
        List<ReconBean> reconBeans = reconciliationService.fetchReconItems(year,month,account,excludedTrans,excludedCombo)
        render view: 'index', model: [bankRecords:bankRecords,reconBeans:reconBeans, command:cmd]
    }

    def remove(){

        if(params.type.toInteger==ReconBean.TRANSACTION){
            session.excludedTrans<<params.id.toLong()
        }else{
            session.excludedCombo<<params.id.toLong()
        }
        redirect action: 'refresh',params: ['year':params.year,'month':params.month,'accountId':params.accountId]
    }

    def validate(ReconValidateCommand command){
        Map returnValues = reconciliationService.validate(command)
        redirect action: 'refresh',params: ['year':returnValues.date.getAt(Calendar.YEAR),'month':returnValues.date.getAt(Calendar.MONTH),'accountId':returnValues.account.id]
    }

    def fetchReconForRecord(){
        BankRecord bankRecord = BankRecord.get(params.bankRecordId.toLong())
        List<Long> excludedTrans = session.excludedTrans
        List<Long> excludedCombo = session.excludedCombo
        List<ReconBean> reconBeans = reconciliationService.fetchReconForRecord(bankRecord,excludedTrans,excludedCombo)
        render template: 'templates/reconItems',model: [reconBeans: reconBeans,bankRecord:bankRecord]
    }

    def create(){
        BankRecord bankRecord = BankRecord.get(params.id)
        TransactionCommand command = new TransactionCommand()
        command.date=bankRecord.date
        command.amount=bankRecord.amount
        command.account=bankRecord.account
        command.location=bankRecord.description.size()>20?bankRecord.description.substring(0,20):bankRecord.description
        command.bankRecord=bankRecord
        render template: 'templates/create', model: [command:command]
    }

    def save(TransactionCommand command){
        if(command.hasErrors()){
            render template: 'templates/create',model: [command: command]
            return
        }
        transactionService.save(command)
        flash.notif=[
                status:'success',
                content:'New Transaction Saved'
        ]
        redirect action: 'refresh',params: ['year':command.date.getAt(Calendar.YEAR),'month':command.date.getAt(Calendar.MONTH),'accountId':command.account.id]
    }
}
