package org.macsuite.financial.command

import grails.validation.Validateable
import org.macsuite.financial.category.Category
import org.macsuite.financial.category.MainCategory

/**
 * Created by tony on 6/12/15.
 */
@Validateable
class CategoryCommand {
    Long    id
    String  name
    String  description
    Boolean cash
    String  type
    Boolean active = true
    Boolean displayOnMobile = true
    Boolean cumulative=false
    MainCategory mainCategory

    static constraints = {
        id nullable: true
        name blank:false
        description nullable: true
        type nullable: false
    }

    CategoryCommand (){}

    CategoryCommand(Category category){
        id=category.id
        name=category.name
        description=category.description
        cash=category.cash
        type=category.type
        active=category.active
        displayOnMobile=category.displayOnMobile
        cumulative=category.cumulative
        mainCategory=category.mainCategory
    }

    Category bind(Category category){
        category.id=id
        category.name=name
        category.description=description
        category.cash=cash
        category.type=type
        category.active=active
        category.displayOnMobile=displayOnMobile
        category.cumulative=cumulative
        category.mainCategory=mainCategory
        return category
    }
}
