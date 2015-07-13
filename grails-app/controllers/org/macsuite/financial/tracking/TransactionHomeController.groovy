package org.macsuite.financial.tracking

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_FINANCIAL_USER'])
class TransactionHomeController {

    def index() {
        [singleList:Transaction.singleTransactions.list(max:5),
        comboList:Transaction.comboTransactions.list(max:5),
        transferList:Transaction.accountTransfers.list(max:5)]
    }
}
