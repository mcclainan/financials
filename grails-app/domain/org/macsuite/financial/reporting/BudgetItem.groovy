package org.macsuite.financial.reporting

import org.macsuite.financial.category.Category

class BudgetItem {
    Integer year
    Integer month
    BigDecimal amount
    Category category

    static constraints = {
        category unique: ['year','month']
    }
}
