package org.macsuite.financial.admin

import grails.plugin.springsecurity.annotation.Secured
import org.macsuite.financial.category.Category
import org.macsuite.financial.category.MainCategory
import org.macsuite.financial.command.CategoryCommand
import org.macsuite.financial.command.MainCategoryCommand

@Secured(['ROLE_ADMIN'])
class AdminMainCategoryController {

    def index() {
        params.max=10
        [mainCategoryList:MainCategory.list(params),mainCategoryCount:MainCategory.count()]
    }

    def show(){
        MainCategory mainCategory = MainCategory.get(params.id)
        if(!mainCategory){
            redirect(action: "index")
            flash.notif = [
                    status:'danger',
                    contnent:flash.msg = message(code: 'error.not.found', args:['Main Category',params.id])
            ]
            return
        }

        [mainCategoryInstance:mainCategory]
    }

    def save(MainCategoryCommand command){
        if(command.hasErrors()){
            params.max=10
            render view: 'index', model: [command:command,mainCategoryList:MainCategory.list(params),mainCategoryCount:MainCategory.count()]
            return
        }
        MainCategory mainCategory = command.bind(new MainCategory())
        mainCategory.save(failOnError: true)
        flash.notif = [
                status: 'success',
                content: message(code:'myDefault.create.message', args: ['Main Category'])
        ]
        redirect action: 'show', id: mainCategory.id
    }

    def edit(){
        MainCategory mainCategory = MainCategory.get(params.id)
        if(!mainCategory){
            redirect(action: 'show', id:params.id.toLong())
            return
        }
        [command:mainCategory]
    }

    def update(MainCategoryCommand command){
        if(command.hasErrors()){
            render(view: 'edit',model:[command:command])
            return
        }
        MainCategory mainCategory = command.bind(MainCategory.get(command.id))
        mainCategory.save(flush: true)
        redirect(action: 'show', id: mainCategory.id)
    }

    def delete(){
        MainCategory mainCategory = MainCategory.get(params.id)
        if(!mainCategory){
            redirect(action: 'show', id:params.id.toLong())
            return
        }
        mainCategory.active = false
        mainCategory.save()

    }

    def saveCategory(CategoryCommand command){
        if(command.hasErrors()){
            render view: 'show', model: [command:command,mainCategoryInstance:command.mainCategory]
            return
        }
        Category category = command.bind(new Category())
        category.save(failOnError: true)
        flash.notif = [
                status: 'success',
                content: message(code:'myDefault.create.message', args: ['Category'])
        ]
        redirect action: 'show', id: category.mainCategory.id
    }
}
