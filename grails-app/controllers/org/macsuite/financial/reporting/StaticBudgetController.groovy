package org.macsuite.financial.reporting

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class StaticBudgetController {
    StaticBudgetService staticBudgetService
    def index() {
        if(BudgetItem.count()<1){
            println 'hello'
            staticBudgetService.setStaticBudget()
        }
        StringBuffer sb = new StringBuffer();

        def list = BudgetItem.budgetSet(2016,2,'I').list()
        def otherList = BudgetItem.budgetSet(2016,2,'E').list()
        [list:list,otherList:otherList,cumlist:staticBudgetService.createCompareObjects(2015,6)]
    }
}
