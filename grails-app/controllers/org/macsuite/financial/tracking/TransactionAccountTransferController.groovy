package org.macsuite.financial.tracking

import grails.plugin.springsecurity.annotation.Secured
import org.macsuite.financial.transaction.command.TransactionAccountTransferCommand

import java.text.DecimalFormat

@Secured(['ROLE_FINANCIAL_USER'])
class TransactionAccountTransferController {

    TransactionAccountTransferService transactionAccountTransferService
    TransactionComboService transactionComboService

    def index() {
        params.max = 10
        [transactionList:Transaction.accountTransfers.list(params),transactionCount:Transaction.accountTransfers.count()]
    }

    def save(TransactionAccountTransferCommand command){
        if(command.hasErrors()){
            params.max = 10
            render view:'index', model:[command:command,transactionList:Transaction.accountTransfers.list(params),transactionCount:Transaction.accountTransfers.count()]
            return
        }

        transactionAccountTransferService.create(command)
        flash.notif = [
                status:'success',
                content: message(code: 'transactionAccountTransfer.save.success',
                                 args: [new DecimalFormat('$#.00').format(command.amount.setScale(2,BigDecimal.ROUND_HALF_DOWN)),
                                        command.fromAccount,command.toAccount])
        ]
        redirect action: 'index'
    }

    def delete(){
        TransactionComboGroup comboGroup = Transaction.get(params.id)?.comboGroup
        flash.notif = [
                status: 'warn',
                content: message(code: 'myDefault.not.found.message', args: [message(code: 'transaction'),params.id])
        ]
        transactionComboService.delete(comboGroup)
        flash.notif = [
                status:'success',
                content:message(code: 'transactionAccountTransfer.delete.success')
        ]
        redirect action: 'index'
    }

}
