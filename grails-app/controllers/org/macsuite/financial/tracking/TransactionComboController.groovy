package org.macsuite.financial.tracking

import grails.plugin.springsecurity.annotation.Secured
import org.macsuite.financial.category.SpecialCategoryLabel
import org.macsuite.financial.transaction.command.TransactionComboCommand
import org.macsuite.financial.transaction.command.TransactionComboGroupCommand

import java.text.DecimalFormat

@Secured(['ROLE_FINANCIAL_USER'])
class TransactionComboController {

    TransactionComboService transactionComboService

    def index() {
        params.max
        [transactionList:Transaction.comboTransactions.list(params),transactionCount:Transaction.comboTransactions.count()]

    }

    def create(TransactionComboGroupCommand command){
        if(command.hasErrors()){
            params.max
            render view:'index',model:[command:command,transactionList:Transaction.comboTransactions.list(params),transactionCount:Transaction.comboTransactions.count()]
            return
        }
        session.groupCommand = command
        session.pendingTransactions = []
        session.cashBack = false

        [total: command.total]
    }

    def addTransaction(TransactionComboCommand command){
        if (command.hasErrors()){
            render view: 'create',model: [command: command]
            return
        }
        session.pendingTransactions<<command
        if(command.cashBack){
            session.pendingTransactions<<new TransactionComboCommand(category: SpecialCategoryLabel.findByLabel('transferOut').category,amount: command.cashBack,description: 'cash back' )
            session.cashBack = true
        }
        BigDecimal total = new BigDecimal('0').setScale(2,BigDecimal.ROUND_HALF_DOWN)
        session.pendingTransactions*.amount.each{amount->
            total = total.add(amount)
        }
        BigDecimal difference = session.groupCommand.total.subtract(total)
        Boolean done=false
        if(difference.compareTo(new BigDecimal('0'))==(-1)){
            command.amount = command.amount.add(difference)
            done = true
        }else if(difference.compareTo(new BigDecimal('0'))==0){
            done = true
        }
        if(difference.compareTo(new BigDecimal('0'))<0){
            difference = new BigDecimal('0')
        }
        render view:'create', model:[done:done,total:difference]
    }

    def removeTransaction(){
        Integer index = params.id.toInteger()
        session.pendingTransactions.remove(index)
        BigDecimal total = new BigDecimal('0')
        session.pendingTransactions*.amount.each{amount->
            total = total.add(amount)
        }
        BigDecimal difference = session.groupCommand.total.subtract(total)
        render view:'create', model:[total:difference]
    }

    def save(){
        List<TransactionComboCommand> pendingTransactions = session.pendingTransactions
        TransactionComboGroupCommand command = session.groupCommand
        println "command.total:${command.total}"
        TransactionComboGroup comboGroup = command.spawn()
        comboGroup.total=command.total
        println "comboGroup.total: ${comboGroup.total}"
        transactionComboService.saveTransactions(comboGroup,pendingTransactions)
        flash.notif=[
                status:'success',
                content:message(code: 'transactionCombo.save.success', args: [pendingTransactions.size(),new DecimalFormat('$#.00').format(comboGroup.total.setScale(2,BigDecimal.ROUND_HALF_DOWN))])
        ]
        redirect action: 'index'
    }

    def edit(){
        session.transactionCallback = 'transactionCombo'
        redirect controller: 'transactionSingle', action: 'edit', id: params.id
    }

    def delete(){
        Transaction transaction = Transaction.get(params.id)
        TransactionComboGroup comboGroup = transaction.comboGroup
        Integer transactionCount = comboGroup.transactions.size()
        String account = comboGroup.account.toString()
        BigDecimal total = comboGroup.total
        transactionComboService.delete(transaction.comboGroup)
        flash.notif=[
                status:'success',
                content:message(code: 'transactionCombo.delete.success', args: [transactionCount,new DecimalFormat('$#.00').format(total.setScale(2,BigDecimal.ROUND_HALF_DOWN).toDouble()),account])
        ]
        redirect action: 'index'
    }
}
