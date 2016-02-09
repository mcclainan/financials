package org.macsuite.financial.netWorth

import grails.transaction.Transactional
import org.macsuite.financial.category.Category
import org.macsuite.financial.category.MainCategory

@Transactional
class AccountingBaseItemService {

    def save(AccountingBaseItemCommand command) {
        AccountingBaseItem acItem = command.bind(new AccountingBaseItem())
        acItem.save(flush:true)

        if(acItem.classification!=AccountingBaseItem.INVESTMENT || (acItem.classification==AccountingBaseItem.GENERAL && acItem.type==AccountingBaseItem.LIABILITY)){
            acItem.payment = new Category(mainCategory: MainCategory.findByName('Financing'),name:"${acItem.name} Payment",cash:true,type: Category.EXPENSE).save(flush: true)
            if(acItem.classification!=AccountingBaseItem.CREDIT_CARD||acItem.classification!=AccountingBaseItem.CREDIT_LINE){
                acItem.proceeds = new Category(mainCategory: MainCategory.findByName('Financing'),name:"${acItem.name} Procedes",cash:true,type: Category.INCOME).save(flush: true)
            }
        }

        if(acItem.classification==AccountingBaseItem.INVESTMENT || (acItem.classification==AccountingBaseItem.GENERAL && acItem.type==AccountingBaseItem.ASSET)){
            acItem.payment = new Category(mainCategory: MainCategory.findByName('Investment'),name:"${acItem.name} Sale"    ,cash:true,type: Category.INCOME).save(flush: true)
            acItem.payment = new Category(mainCategory: MainCategory.findByName('Investment'),name:"${acItem.name} Purchase",cash:true,type: Category.EXPENSE).save(flush: true)
        }
        acItem.save()
    }
}
