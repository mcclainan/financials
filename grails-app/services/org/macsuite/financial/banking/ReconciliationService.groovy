package org.macsuite.financial.banking

import grails.transaction.Transactional
import org.macsuite.financial.MacDateService
import org.macsuite.financial.beans.ReconBean
import org.macsuite.financial.beans.StartAndEndDate
import org.macsuite.financial.category.SpecialCategoryLabel
import org.macsuite.financial.tracking.Transaction
import org.macsuite.financial.tracking.TransactionComboGroup
import org.macsuite.financial.tracking.TransactionService
import org.macsuite.financial.transaction.command.TransactionCommand

@Transactional
class ReconciliationService {

    MacDateService macDateService
    TransactionService transactionService

    List<ReconBean> fetchReconItems(Integer year, Integer month, Account account, List<Long> excludedTransaction, List<Long> excludedCombos) {
        List<ReconBean> reconBeans = []
        StartAndEndDate startAndEndDate = macDateService.getStartAndEnd(month,year)
        Transaction.recon(startAndEndDate.startDate,startAndEndDate.endDate,account.id,excludedTransaction).list().each{trans->
            reconBeans<<new ReconBean(date: trans.date,id: trans.id,amount: trans.amount, account:trans.account, type: ReconBean.TRANSACTION,location: trans.location)
        }
        TransactionComboGroup.recon(startAndEndDate.startDate,startAndEndDate.endDate,account.id,excludedCombos).list().each{ group ->
            reconBeans<<new ReconBean(date: group.date,id: group.id,amount: group.total, account:group.account, type: ReconBean.COMBO,location: group.location)
        }
        return reconBeans.sort{it.date}
    }

    List<ReconBean> fetchReconForRecord(BankRecord bankRecord, List<Long> excludedTransaction, List<Long> excludedCombos) {
        List<ReconBean> reconBeans = []
        Transaction.reconForRecord(bankRecord.date,bankRecord.amount,bankRecord.account.id,excludedTransaction).list().each{trans->
            reconBeans<<new ReconBean(date: trans.date,id: trans.id,amount: trans.amount, account:trans.account, type: ReconBean.TRANSACTION, location:trans.location)
        }
        TransactionComboGroup.reconForRecord(bankRecord.date,bankRecord.amount,bankRecord.account.id,excludedCombos).list().each{ group ->
            reconBeans<<new ReconBean(date: group.date,id: group.id,amount: group.total, account:group.account, type: ReconBean.COMBO,location: group.location)
        }

        return reconBeans.sort{it.date}
    }

    List<BankRecord> fetchBankRecords(Integer year, Integer month, Account account){
        StartAndEndDate startAndEndDate = macDateService.getStartAndEnd(month,year)
        return BankRecord.recon(startAndEndDate.startDate,startAndEndDate.endDate,account.id).list()
    }

    def validate(ReconValidateCommand command){
        BankRecord record = BankRecord.get(command.recordId)
        Transaction transaction
        Date date
        TransactionComboGroup group
        if(command.reconType==ReconBean.TRANSACTION){
            transaction=Transaction.get(command.reconId)
            transaction.bankRecord=record
            transactionService.update(new TransactionCommand(transaction))
            date = transaction.date
        }else{
            group = TransactionComboGroup.get(command.reconId)
            group.transactions.each {trans->
                if(trans.category.id!=SpecialCategoryLabel.findByLabel('transferIn').category.id){
                    trans.bankRecord=record
                    transactionService.update(new TransactionCommand(trans))
                    if(!date){
                        date = trans.date
                    }
                }
            }
            group.validated=true
        }
        return [date:date,account: record.account]
    }
}
