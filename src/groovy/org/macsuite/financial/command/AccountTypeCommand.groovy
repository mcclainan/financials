package org.macsuite.financial.command

import grails.validation.Validateable
import org.macsuite.financial.banking.AccountType

/**
 * Created by tony on 6/13/15.
 */
@Validateable
class AccountTypeCommand {
    Long id
    String  type
    String  resourceType
    static constraints = {
        id nullable: true
        type blank: false
        resourceType blank: false
    }
    AccountTypeCommand(){}
    AccountTypeCommand(AccountType accountType){
        id=accountType.id
        type=accountType.type
        resourceType=accountType.resourceType
    }
    AccountType bind(AccountType accountType){
        accountType.type=type
        accountType.resourceType=resourceType
        return accountType
    }
}
