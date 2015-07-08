package org.macsuite.financial.tracking

import grails.transaction.Transactional
import org.macsuite.financial.category.Category
import org.macsuite.financial.category.SpecialCategoryLabel
import org.macsuite.financial.transaction.command.TransactionAccountTransferCommand
import org.macsuite.financial.transaction.command.TransactionCommand

@Transactional
class TransactionAccountTransferService {

    TransactionService transactionService
    def create(TransactionAccountTransferCommand command) {
        Category inCatgory = SpecialCategoryLabel.findByLabel('transferIn').category
        Category outCatgory = SpecialCategoryLabel.findByLabel('transferOut').category

        TransactionComboGroup comboGroup = new TransactionComboGroup(date:command.date,account:command.toAccount,total:command.amount,type:'transfer',location: command.location).save(flush: true, failOnError: true)

        TransactionCommand transactionCommand = new TransactionCommand(date: command.date,location: command.location,category:inCatgory,account: command.toAccount,amount: command.amount, comboGroup: comboGroup )
        transactionService.save(transactionCommand)
        BigDecimal outAmount = command.amount.add(command.fee?:new BigDecimal('0'))
        transactionCommand = new TransactionCommand(date: command.date,location: command.location,category:outCatgory,account: command.fromAccount,amount:outAmount, comboGroup: comboGroup )
        transactionService.save(transactionCommand)
    }
}
