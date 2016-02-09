package org.macsuite.financial.netWorth

import grails.validation.Validateable
import org.macsuite.financial.banking.Account
import org.macsuite.financial.category.Category

/**
 * Created by tony on 9/3/15.
 */
@Validateable
class AccountingBaseItemCommand {
    String     name
    String     description
    String     type
    String     classification
    BigDecimal balance
    BigDecimal limit
    Account    account

    static constraints = {
        name nullable:false
        description nullable:false
        type nullable:false
        classification nullable:false
        balance nullable:false
        limit nullable:true, validator: {value,object->
            if((object.classification==AccountingBaseItem.CREDIT_CARD||
                    object.classification==AccountingBaseItem.CREDIT_LINE) && !value){
                return 'nullable'
            }
        }
        account nullable:true, validator: { value, object ->
            if ((object.classification == AccountingBaseItem.CREDIT_CARD ||
                    object.classification == AccountingBaseItem.CREDIT_LINE) && !value) {
                return 'nullable'
            }
        }
    }

    AccountingBaseItemCommand(){}

    AccountingBaseItemCommand(AccountingBaseItem abItem){
        name=abItem.name
        description=abItem.description
        type=abItem.type
        classification=abItem.classification
        balance=abItem.balance
        limit=abItem.limit
        account=abItem.account
    }

    AccountingBaseItem bind(AccountingBaseItem abItem){
        abItem.name=name
        abItem.description=description
        abItem.type=type
        abItem.classification=classification
        abItem.balance=balance
        abItem.limit=limit
        abItem.account=account
        abItem
    }
}
