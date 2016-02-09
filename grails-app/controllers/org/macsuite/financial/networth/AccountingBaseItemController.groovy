package org.macsuite.financial.networth

import org.macsuite.financial.netWorth.AccountingBaseItem
import org.macsuite.financial.netWorth.AccountingBaseItemCommand
import org.macsuite.financial.netWorth.AccountingBaseItemService

class AccountingBaseItemController {

    AccountingBaseItemService accountingBaseItemService

    def index() {

    }

    def create(){

    }

    def save(AccountingBaseItemCommand command){
        if(command.hasErrors()){
            render view: "create", model: [command:command]
            return
        }
        AccountingBaseItem accountingBaseItem = accountingBaseItemService.save(command)
        redirect action:'show', id: accountingBaseItem.id
    }

    def show(AccountingBaseItem accountingBaseItem){
        if(!accountingBaseItem){
            flash.notif = [
                    status:'info',
                    content: message(code: 'error.not.found',args: ['Accounting Base Item',params.id])
            ]
            redirect action: 'index'
            return
        }
        [accountingBaseItem:accountingBaseItem]
    }

    def edit(){

    }
}
