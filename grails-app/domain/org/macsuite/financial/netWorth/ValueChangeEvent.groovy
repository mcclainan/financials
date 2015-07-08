package org.macsuite.financial.netWorth

class ValueChangeEvent implements Serializable{
    Date date
    BigDecimal amount
    String type
    static hasOne = [accountingBaseItem:AccountingBaseItem]
    static final String APPRECIATION = 'appreciation'
    static final String DEPRECIATION = 'depreciation'
    static final List<String> TYPE_LIST = [APPRECIATION,DEPRECIATION]
    static constraints = {
        date blank:false
        amount blank:false
        type blank: false, inList: TYPE_LIST
    }

}
