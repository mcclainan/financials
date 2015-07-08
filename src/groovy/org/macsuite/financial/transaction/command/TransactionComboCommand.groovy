package org.macsuite.financial.transaction.command

import grails.validation.Validateable
import org.macsuite.financial.category.Category

/**
 * Created by tony on 6/22/15.
 */
@Validateable
class   TransactionComboCommand {
    String description
    BigDecimal amount
    Category category
    BigDecimal cashBack

    static constraints = {
        description nullable: true
    }
}
