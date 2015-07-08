package admin

import grails.plugin.springsecurity.annotation.Secured
import org.macsuite.financial.banking.Account
import org.macsuite.financial.command.AccountCommand

@Secured(['ROLE_ADMIN'])
class AdminAccountController {
def index() {
        params.max=10
        [accountList:Account.list(params),accountCount:Account.count()]
    }

    def show(){
        Account account = Account.get(params.id)
        if(!account){
            flash.notif = [
                    status:'danger',
                    contnent:flash.msg = message(code: 'error.not.found', args:['Account Type',params.id])
            ]
            redirect(action: "index")
            return
        }

        [accountInstance:account]
    }

    def save(AccountCommand command){
        if(command.hasErrors()){
            params.max=10
            render view: 'index', model: [command:command,accountList:Account.list(params),accountCount:Account.count()]
            return
        }
        Account account = command.bind(new Account())
        account.save(failOnError: true)
        flash.notif = [
                status: 'success',
                content: message(code:'myDefault.create.message', args: ['Account Type'])
        ]
        redirect action: 'show', id: account.id
    }

    def edit(){
        Account account = Account.get(params.id)
        if(!account){
            redirect(action: 'show', id:params.id.toLong())
            return
        }
        [command:account]
    }

    def update(AccountCommand command){
        if(command.hasErrors()){
            render(view: 'edit',model:[command:command])
            return
        }
        Account account = command.bind(Account.get(command.id))
        account.save(flush: true)
        redirect(action: 'show', id: account.id)
    }

    def delete(){
        Account account = Account.get(params.id)
        if(!account){
            redirect(action: 'show', id:params.id.toLong())
            return
        }
        account.active = false
        account.save()

    }
}
