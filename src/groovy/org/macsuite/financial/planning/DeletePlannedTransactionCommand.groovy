package org.macsuite.financial.planning

import grails.validation.Validateable
import org.macsuite.financial.category.Category

/**
 * Created by tony on 7/1/15.
 */
@Validateable
class DeletePlannedTransactionCommand {
    Date startDate
    Date endDate
    Category category
    static constraints = {
        endDate validator: {value,object->if(value<=object.startDate){return 'invalid'}}
    }
}
