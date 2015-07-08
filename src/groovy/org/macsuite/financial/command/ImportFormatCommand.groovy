package org.macsuite.financial.command

import grails.validation.Validateable
import org.macsuite.financial.banking.ImportFormat

/**
 * Created by tony on 6/12/15.
 */
@Validateable
class ImportFormatCommand {
    Long    id
    String  name
    Integer dateColumn
    Integer descriptionColumn
    Integer amountColumn
    Integer debitColumn
    Integer creditColumn
    Boolean active = true
    Boolean hasMultipleAmountColumns = false
    Boolean hasHeading = false

    static constraints = {
        id nullable:true,blank:true
        name nullable:false,blank:false
        dateColumn nullable:false,blank:false
        descriptionColumn nullable:false,blank:false
        amountColumn nullable:true,blank:true, validator:{v,o->if(!v && !o.hasMultipleAmountColumns){return 'nullable'}}
        debitColumn nullable:true,blank:true, validator:{v,o->if(!v && o.hasMultipleAmountColumns && !o.amountColumn){return 'nullable'}}
        creditColumn nullable:true,blank:true, validator:{v,o->if(!v && o.hasMultipleAmountColumns && !o.amountColumn){return 'nullable'}}
        active nullable:true,blank:true
        hasMultipleAmountColumns nullable:true,blank:true, validator:{v,o->if(v && o.amountColumn){return 'illegalSelection'}}
        hasHeading nullable:true,blank:true
    }
    ImportFormatCommand(){}
    ImportFormatCommand(ImportFormat importFormat){
        id=importFormat.id
        name=importFormat.name
        dateColumn=importFormat.dateColumn
        descriptionColumn=importFormat.descriptionColumn
        amountColumn=importFormat.amountColumn
        debitColumn=importFormat.debitColumn
        creditColumn=importFormat.creditColumn
        active=importFormat.active
        hasMultipleAmountColumns=importFormat.hasMultipleAmountColumns
        hasHeading=importFormat.hasHeading
    }

    ImportFormat bind(ImportFormat importFormat){
        importFormat.name=name
        importFormat.dateColumn=dateColumn
        importFormat.descriptionColumn=descriptionColumn
        importFormat.amountColumn=amountColumn
        importFormat.debitColumn=debitColumn
        importFormat.creditColumn=creditColumn
        importFormat.active=active
        importFormat.hasMultipleAmountColumns=hasMultipleAmountColumns
        importFormat.hasHeading=hasHeading
        return importFormat
    }
}
