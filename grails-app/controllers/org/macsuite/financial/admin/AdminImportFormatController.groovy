package org.macsuite.financial.admin

import grails.plugin.springsecurity.annotation.Secured
import org.macsuite.financial.banking.Account
import org.macsuite.financial.banking.ImportFormat
import org.macsuite.financial.command.AccountCommand
import org.macsuite.financial.command.ImportFormatCommand

@Secured(['ROLE_ADMIN'])
class AdminImportFormatController {
    def index() {
        params.max=10
        [importFormatList:ImportFormat.list(params),importFormatCount:ImportFormat.count()]
    }

    def show(){
        ImportFormat importFormat = ImportFormat.get(params.id)
        if(!importFormat){
            flash.notif = [
                    status:'danger',
                    contnent:message(code: 'error.not.found', args:['Import Format',params.id])
            ]
            redirect(action: "index")
            return
        }

        [importFormatInstance:importFormat]
    }

    def save(ImportFormatCommand command){
        if(command.hasErrors()){
            params.max=10
            render view: 'index', model: [command:command,importFormatList:ImportFormat.list(params),importFormatCount:ImportFormat.count()]
            return
        }
        ImportFormat importFormat = command.bind(new ImportFormat())
        importFormat.save(failOnError: true)
        flash.notif = [
                status: 'success',
                content: message(code:'myDefault.create.message', args: ['Import Format'])
        ]
        redirect action: 'show', id: importFormat.id
    }

    def edit(){
        ImportFormat importFormat = ImportFormat.get(params.id)
        if(!importFormat){
            redirect(action: 'show', id:params.id.toLong())
            return
        }
        [command:importFormat]
    }

    def update(ImportFormatCommand command){
        if(command.hasErrors()){
            render(view: 'edit',model:[command:command])
            return
        }
        ImportFormat importFormat = command.bind(ImportFormat.get(command.id))
        importFormat.save(flush: true)
        redirect(action: 'show', id: importFormat.id)
    }

    def delete(){
        ImportFormat importFormat = ImportFormat.get(params.id)
        if(!importFormat){
            redirect(action: 'show', id:params.id.toLong())
            return
        }
        importFormat.active = false
        importFormat.save()

    }

    def saveAccount(AccountCommand command){
        if(command.hasErrors()){
            params.max=10
            render view: 'show', model: [command:command,importFormatInstance:command.importFormat]
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
