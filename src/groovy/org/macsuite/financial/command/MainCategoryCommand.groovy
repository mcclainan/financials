package org.macsuite.financial.command

import grails.validation.Validateable
import org.macsuite.financial.category.MainCategory

/**
 * Created by tony on 6/12/15.
 */
@Validateable
class MainCategoryCommand {
    Long id
    String name
    String description
    Boolean active=true

    static constraints = {
        id nullable: true
        name nullable: false
        description nullable: true
        active nullable: true
    }

    MainCategoryCommand(){}

    MainCategoryCommand(MainCategory mainCategory){
        id=mainCategory.id
        name=mainCategory.name
        description=mainCategory.description
        active=mainCategory.active
    }

    MainCategory bind(MainCategory mainCategory){
        mainCategory.name=name
        mainCategory.description=description
        mainCategory.active=active
        return mainCategory
    }
}
