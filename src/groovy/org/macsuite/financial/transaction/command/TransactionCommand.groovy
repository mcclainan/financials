package org.macsuite.financial.transaction.command

import grails.validation.Validateable
import org.macsuite.financial.banking.Account
import org.macsuite.financial.category.Category
import org.macsuite.financial.tracking.Transaction
import org.macsuite.financial.tracking.TransactionComboGroup

/**
 * Created by tony on 6/16/15.
 */
@Validateable
class TransactionCommand {
    Long id
    Date       date
    String     location
    String     description
    BigDecimal amount
    BigDecimal cashBack
    Category   category
    Account    account
    Boolean    temporary
    TransactionComboGroup comboGroup

    static constraints={
        id nullable: true
        date blank:false
        location blank: false
        description nullable: true, blank: true
        amount blank:false, min:new BigDecimal('0'), scale: 2
        category nullable: false
        account nullable: false
        comboGroup nullable: true
        cashBack nullable: true
        temporary nullable: true
    }

    TransactionCommand (){}

    TransactionCommand(Transaction transaction){
        id=transaction.id
        date=transaction.date
        location=transaction.location
        description=transaction.description
        amount=transaction.amount
        category=transaction.category
        account=transaction.account
        temporary=transaction.temporary
        comboGroup=transaction.comboGroup
    }

    TransactionCommand(TransactionComboGroup comboGroup,TransactionComboCommand command){
        date=comboGroup.date
        location=comboGroup.location
        description=command.description
        amount=command.amount
        category=command.category
        account=comboGroup.account
        this.comboGroup=comboGroup
    }

    Transaction bind(Transaction transaction){
        transaction.date=date
        transaction.location=location
        transaction.description=description
        transaction.amount=amount
        transaction.category=category
        transaction.account=account
        transaction.comboGroup=comboGroup
        transaction.temporary=temporary
        return transaction
    }
}
