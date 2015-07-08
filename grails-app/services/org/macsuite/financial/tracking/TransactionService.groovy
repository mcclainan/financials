package org.macsuite.financial.tracking

import grails.transaction.Transactional
import org.macsuite.financial.banking.Account
import org.macsuite.financial.category.Category
import org.macsuite.financial.transaction.command.TransactionCommand

@Transactional
class TransactionService implements Serializable {
    TransactionComboService transactionComboService
    def save(TransactionCommand command) {
        Transaction transaction = command.bind(new Transaction())
        Account account = transaction.account
        Category category = transaction.category

        if(category.type=='I'){
            account.balance = account.balance.add(transaction.amount.abs()).setScale(2,BigDecimal.ROUND_HALF_DOWN)
        }else{
            account.balance = account.balance.subtract(transaction.amount.abs()).setScale(2,BigDecimal.ROUND_HALF_DOWN)
        }

        transaction.save(flush: true, failOnError: true)
        account.save(flush: true, failOnError: true)
    }

    def update(TransactionCommand command){
        Transaction transaction = Transaction.get(command.id)
        Account account = transaction.account
        Category category = transaction.category
        TransactionComboGroup comboGroup = transaction.comboGroup
        BigDecimal difference = command.amount.abs().subtract(transaction.amount.abs())

        if(category.type=='I'){
            account.balance = account.balance.add(difference).setScale(2,BigDecimal.ROUND_HALF_DOWN)
        }else{
            account.balance = account.balance.subtract(difference).setScale(2,BigDecimal.ROUND_HALF_DOWN)
        }

        if(comboGroup){
            updateComboGroup(transaction,command,comboGroup)
        }
        command.bind(transaction).save(flush: true)
        account.save(flush: true)
        comboGroup?.save(flush: true)
    }

    def updateComboGroup(Transaction transaction,TransactionCommand command,TransactionComboGroup comboGroup){
        Category category = transaction.category
        if(comboGroup.type=='combo'){
            BigDecimal difference = command.amount.abs().subtract(transaction.amount.abs())

            if(category.type=='I'){
                comboGroup.total = comboGroup.total.add(difference).setScale(2,BigDecimal.ROUND_HALF_DOWN)
            }else{
                comboGroup.total = comboGroup.total.subtract(difference).setScale(2,BigDecimal.ROUND_HALF_DOWN)
            }
        }
    }


    def delete(Transaction transaction){
        Account account = transaction.account
        Category category = transaction.category

        if(category.type=='I'){
            account.balance = account.balance.subtract(transaction.amount.abs()).setScale(2,BigDecimal.ROUND_HALF_DOWN)
        }else{
            account.balance = account.balance.add(transaction.amount.abs()).setScale(2,BigDecimal.ROUND_HALF_DOWN)
        }
        account.save(flush: true)
        if(transaction.comboGroup){return}
        transaction.delete()
    }
}
