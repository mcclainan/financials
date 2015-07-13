package org.macsuite.financial.admin

import grails.plugin.springsecurity.annotation.Secured
import org.macsuite.financial.banking.Account
import org.macsuite.financial.banking.AccountType
import org.macsuite.financial.command.AccountCommand
import org.macsuite.financial.command.AccountTypeCommand

@Secured(['ROLE_ADMIN'])
class AdminAccountTypeController {

    def index() {
        params.max=10
        [accountTypeList:AccountType.list(params),accountTypeCount:AccountType.count()]
    }

    def show(){
        AccountType accountType = AccountType.get(params.id)
        if(!accountType){
            flash.notif = [
                    status:'danger',
                    contnent:flash.msg = message(code: 'error.not.found', args:['Account Type',params.id])
            ]
            redirect(action: "index")
            return
        }

        [accountTypeInstance:accountType]
    }

    def save(AccountTypeCommand command){
        if(command.hasErrors()){
            params.max=10
            render view: 'index', model: [command:command,accountTypeList:AccountType.list(params),accountTypeCount:AccountType.count()]
            return
        }
        AccountType accountType = command.bind(new AccountType())
        accountType.save(failOnError: true)
        flash.notif = [
                status: 'success',
                content: message(code:'myDefault.create.message', args: ['Account Type'])
        ]
        redirect action: 'show', id: accountType.id
    }

    def edit(){
        AccountType accountType = AccountType.get(params.id)
        if(!accountType){
            redirect(action: 'show', id:params.id.toLong())
            return
        }
        [command:accountType]
    }

    def update(AccountTypeCommand command){
        if(command.hasErrors()){
            render(view: 'edit',model:[command:command])
            return
        }
        AccountType accountType = command.bind(AccountType.get(command.id))
        accountType.save(flush: true)
        redirect(action: 'show', id: accountType.id)
    }

    def delete(){
        AccountType accountType = AccountType.get(params.id)
        if(!accountType){
            redirect(action: 'show', id:params.id.toLong())
            return
        }
        accountType.active = false
        accountType.save()

    }

    def saveAccount(AccountCommand command){
        if(command.hasErrors()){
            params.max=10
            render view: 'show', model: [command:command,accountTypeInstance:command.type]
            return
        }
        Account account = command.bind(new Account())
        account.save(failOnError: true)
        flash.notif = [
                status: 'success',
                content: message(code:'myDefault.create.message', args: ['Account'])
        ]
        redirect action: 'show', id: command.importFormat.id
    }
}
