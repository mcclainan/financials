package org.macsuite.financial.tracking

import grails.transaction.Transactional
import org.macsuite.financial.banking.SpecialAccountLabel
import org.macsuite.financial.category.SpecialCategoryLabel
import org.macsuite.financial.transaction.command.TransactionComboCommand
import org.macsuite.financial.transaction.command.TransactionCommand

@Transactional
class TransactionComboService {
    TransactionService transactionService
    def saveTransactions(TransactionComboGroup comboGroup,List<TransactionComboCommand> commandList){
        comboGroup.save(flush: true)
        Long tranferCategoryId = SpecialCategoryLabel.findByLabel('transferOut')?.id
        commandList.each{command->
            println"Saving transaction ${command.category}:${command.amount}"
            transactionService.save(new TransactionCommand(comboGroup,command))
            if(command.category.id == tranferCategoryId){
                def transCommand = new TransactionCommand(comboGroup,command)
                transCommand.category = SpecialCategoryLabel.findByLabel('transferIn').category
                transCommand.account = SpecialAccountLabel.findByLabel('cash').account
                transactionService.save(transCommand)
            }
        }
    }

    def delete(TransactionComboGroup group){
        group.transactions.each {transaction->
            transactionService.delete(transaction)
        }
        group.transactions.clear()
        group.delete(flush: true)
    }
}
