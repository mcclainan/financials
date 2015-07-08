package org.macsuite.financial.planning

import grails.validation.Validateable
import org.macsuite.financial.category.Category

/**
 * Created by tony on 7/1/15.
 */
@Validateable
class CreatePlannedTransactionCommand {
    static final String SINGLE='Single'
    static final String MULTI='Set'
    static final String DAILY='Daily'
    static final String WEEKLY='Weekly'
    static final String MONTHLY='Monthly'
    static final String CUSTOM='Custom'
    static final String DAY='Day'
    static final String WEEK='Week'
    static final String MONTH='Month'
    static final String AGGREGATE='Aggregate'
    static final String SPREAD='Spread'
    static final List<String> MODE_LIST=[SINGLE,MULTI]
    static final List<String> AMOUNT_MODE_LIST=[AGGREGATE,SPREAD]
    static final List<String> FREQUENCY_LIST=[DAILY,WEEKLY,MONTHLY,CUSTOM]
    static final List<String> CUSTOM_FREQUENCY_TYPE_LIST =[DAY,WEEK,MONTH]

    Category category
    String mode
    Date startDate
    Date endDate
    Boolean replaceCurrent
    String amountMode
    BigDecimal amount
    String frequency
    Integer customFrequency
    String customFrequencyType

    static constraints={
        category blank:false
        mode blank:false,inList: MODE_LIST
        startDate min: new Date().clearTime()
        endDate validator: {value,object->if(object.mode==MULTI&&object.startDate>value){return 'invalidEndDate'}}
        replaceCurrent nullable: true
        amountMode nullable: true,inList: AMOUNT_MODE_LIST,validator:{value,object->if(object.mode==MULTI && !value){return 'nullable'}}
        amount nullable: false
        frequency nullable: true, inList: FREQUENCY_LIST,validator:{value,object->if(object.mode==MULTI && !value){return 'nullable'}}
        customFrequency nullable: true, min: 2, validator: {value,object->if(object.frequency==CUSTOM && !value){return 'nullable'}}
        customFrequencyType nullable: true, inList: CUSTOM_FREQUENCY_TYPE_LIST, validator: {value,object->if(object.frequency==CUSTOM && !value){return 'nullable'}}
    }
}
