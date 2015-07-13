package org.macsuite.financial.admin

import grails.plugin.springsecurity.annotation.Secured
import org.macsuite.financial.category.Category
import org.macsuite.financial.command.CategoryCommand

@Secured(['ROLE_ADMIN'])
class AdminCategoryController {

    def index(){
        params.max=10
        [categoryList:Category.list(params),categoryCount:Category.count()]
    }

    def show(){
        Category category = Category.get(params.id)
        if(!category){
            flash.notif = [
                    status:'danger',
                    contnent:flash.msg = message(code: 'error.not.found', args:['Category',params.id])
            ]
            redirect(action: "index")
            return
        }

        [categoryInstance:category]
    }

    def save(CategoryCommand command){
        if(command.hasErrors()){
            params.max=10
            render view: 'index', model: [command:command,categoryList:Category.list(params),categoryCount:Category.count()]
            return
        }
        Category category = command.bind(new Category())
        category.save(failOnError: true)
        flash.notif = [
                status: 'success',
                content: message(code:'myDefault.create.message', args: ['Main Category'])
        ]
        redirect action: 'show', id: category.id
    }

    def edit(){
        Category category = Category.get(params.id)
        if(!category){
            redirect(action: 'show', id:params.id.toLong())
            return
        }
        [command:category]
    }

    def update(CategoryCommand command){
        if(command.hasErrors()){
            render(view: 'edit',model:[command:command])
            return
        }
        Category category = command.bind(Category.get(command.id))
        category.save(flush: true)
        redirect(action: 'show', id: category.id)
    }

    def delete(){
        Category category = Category.get(params.id)
        if(!category){
            redirect(action: 'show', id:params.id.toLong())
            return
        }
        category.active = false
        category.save()

    }
}
