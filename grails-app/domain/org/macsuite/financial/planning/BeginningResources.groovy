package org.macsuite.financial.planning

class BeginningResources implements Serializable{
    Date       beginDate
    BigDecimal cash 
    BigDecimal credit 
    BigDecimal benefits 
    BigDecimal other 
    static constraints = {
        beginDate nullable:true,blank:true
        cash nullable:true,blank:true
        credit nullable:true,blank:true
        benefits nullable:true,blank:true
        other nullable:true,blank:true
    }

    BigDecimal getTotal(){
        BigDecimal total = new BigDecimal('0')
        total = total.add(cash)
        total = total.add(credit)
        total = total.add(benefits)
        total = total.add(other)
        return  total
    }
}
