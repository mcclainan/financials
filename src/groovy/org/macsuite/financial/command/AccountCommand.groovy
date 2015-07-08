package org.macsuite.financial.command

import grails.validation.Validateable
import org.macsuite.financial.banking.Account
import org.macsuite.financial.banking.AccountType
import org.macsuite.financial.banking.ImportFormat

/**
 * Created by tony on 6/13/15.
 */
@Validateable
class AccountCommand {
    Long id
    String       title
    BigDecimal   balance
	Boolean      liquid = true
	Boolean      active = true
	ImportFormat importFormat
	AccountType  type
	
    static constraints = {
		id nullable: true
		title nullable:false
		balance nullable:true
		liquid nullable:true
		active nullable:true
		importFormat nullable:false
		type nullable:false
    }
    AccountCommand(){}
    AccountCommand(Account account){
		id=account.id
		title=account.title
		balance=account.balance
		liquid=account.liquid
		active=account.active
		importFormat=account.importFormat
		type =account.type 
    }
    Account bind(Account account){
		account.title=title
		account.balance=balance
		account.liquid=liquid
		account.active=active
		account.importFormat=importFormat
		account.type  =type 
		return account
    }
}
